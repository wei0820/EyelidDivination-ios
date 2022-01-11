//
//  UserLoginViewController.swift
//  EyelidDivination-ios
//
//  Created by mac on 2022/1/10.
//

import UIKit
import RxSwift
import RxCocoa
class UserLoginViewController: UIViewController {
    @IBOutlet weak var userMailLoginTex: UITextField!
    @IBOutlet weak var userPasswordLoginTex: UITextField!
    let disposeBag = DisposeBag()
    let useLoginViewModel = UserloginModel()

    @IBOutlet weak var userLoginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    func initLayout(){
        let userLoginMailValid = userMailLoginTex.rx.text.orEmpty.map{
            self.validateEmail(candidate: $0) == true
        }.share(replay: 1)
        userLoginMailValid.bind(to:userPasswordLoginTex.rx.isEnabled).disposed(by: disposeBag)
        let userLoginPasswordValid = userPasswordLoginTex.rx.text.orEmpty.map{ $0.count >= 8}.share(replay:1)
        
        let isLoginVaild = Observable.combineLatest(userLoginMailValid, userLoginPasswordValid){$0 && $1}.share(replay: 1)
        isLoginVaild.bind(to: userLoginButton.rx.isEnabled).disposed(by: disposeBag)
        
        useLoginViewModel.setUserMail(userMail:userMailLoginTex.rx.text.orEmpty.asObservable())
        useLoginViewModel.setUserPassword(userPassword: userPasswordLoginTex.rx.text.orEmpty.asObservable())
        
        useLoginViewModel.setuserLogin(userlogin:userLoginButton.rx.tap.asObservable())
        

        
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func showAlert() {
        let alertView = UIAlertView(
            title: "RxExample",
            message: "This is wonderful",
            delegate: nil,
            cancelButtonTitle: "OK"
        )

        alertView.show()
    }
    
    func validateEmail(candidate: String) -> Bool
    
    {
        if(candidate.count >= 12){
            
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
            return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: candidate)
        }
        return false
        
 
    }
}
