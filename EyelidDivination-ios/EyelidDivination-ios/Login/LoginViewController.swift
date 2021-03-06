//
//  LoginViewController.swift
//  EyelidDivination-ios
//
//  Created by mac on 2022/1/5.
//

import UIKit
import RxSwift
import RxCocoa
import RxGesture
class LoginViewController: UIViewController {

    @IBOutlet weak var userMailText: UITextField!
    let disposeBag = DisposeBag()
    var subject = PublishSubject<String>()

    @IBOutlet weak var inputButton: UIButton!
    @IBOutlet weak var userPasswordTet: UITextField!
    @IBOutlet weak var userPasswordOutlet: UILabel!
    var loginModel = LoginModel()
    
    @IBOutlet weak var userMailOutlet: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        ititLayout()
    
        // Do any additional setup after loading the view.
    }
    
    func ititLayout(){
        
        let userMailValid = userMailText.rx.text.orEmpty.map {  self.validateEmail(candidate: $0) == true}
            .share(replay: 1)
        userMailValid.bind(to:userPasswordTet.rx.isEnabled).disposed(by: disposeBag)
        userMailValid.bind(to: userMailOutlet.rx.isHidden).disposed(by: disposeBag)
        let userPasswordValid = userPasswordTet.rx.text.orEmpty.map{ $0.count >= 8}.share(replay: 1)
        userPasswordValid.bind(to: userPasswordOutlet.rx.isHidden).disposed(by: disposeBag)
        
        let everythingVaild = Observable.combineLatest(userMailValid, userPasswordValid){$0 && $1}.share(replay: 1)
        everythingVaild.bind(to: inputButton.rx.isEnabled).disposed(by: disposeBag)
        loginModel.setUserMail(stringObservable: userMailText.rx.text.orEmpty.asObservable())

        loginModel.setUserPassword(passwordObservable: userPasswordTet.rx.text.orEmpty.asObservable())

        loginModel.createUser(onClickObservable: inputButton.rx.tap.asObservable(),view: self)

        
        userMailText.rx.text.orEmpty.bind(to: userMailOutlet.rx.text).disposed(by: disposeBag)

        
        
    
        }
    
    
    func validateEmail(candidate: String) -> Bool
    
    {
        if(candidate.count >= 12){
            
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
            return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: candidate)
        }
        return false
        
 
    }
    func showAlert() {
        let alertView = UIAlertView(
            title: "RxExample",
            message: "This is wonderful",
            delegate: nil,
            cancelButtonTitle: "OK"
        )

        alertView.show()
        
    }
    
    
    

    
    

}
