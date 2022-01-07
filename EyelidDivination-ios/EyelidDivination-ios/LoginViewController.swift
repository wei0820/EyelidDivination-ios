//
//  LoginViewController.swift
//  EyelidDivination-ios
//
//  Created by mac on 2022/1/5.
//

import UIKit
import RxSwift
import RxCocoa
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var userMailText: UITextField!
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var inputButton: UIButton!
    @IBOutlet weak var userPasswordTet: UITextField!
    @IBOutlet weak var userPasswordOutlet: UILabel!
    
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
        
        let userPasswordValid = userPasswordTet.rx.text.orEmpty.map{ $0.count >= 12}.share(replay: 1)
        userPasswordValid.bind(to: userPasswordOutlet.rx.isHidden).disposed(by: disposeBag)
        
        let everythingVaild = Observable.combineLatest(userMailValid, userPasswordValid){$0 && $1}.share(replay: 1)
        everythingVaild.bind(to: inputButton.rx.isEnabled).disposed(by: disposeBag)
//        inputButton.rx.tap.subscribe(onNext:{
//
//
//        }).disposed(by: disposeBag)
        
   
        
    
    }
    func validateEmail(candidate: String) -> Bool
    
    {
        if(candidate.count >= 12){
            
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
            return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: candidate)
        }
        return false
        
 
    }
    //驗證手機號
      func isPhoneNumber(phoneNumber:String) -> Bool {
         let mobile = "^1([358][0-9]|4[579]|66|7[0135678]|9[89])[0-9]{8}$"
         let regexMobile = NSPredicate(format: "SELF MATCHES %@",mobile)
         if regexMobile.evaluate(with: phoneNumber) == true {
             print("jack","true")
             return true
         }else
         {             print("jack","false")

             return false
         }
     }
    
    func checkCount(count : Int) -> Bool{
        
        if(count>=10){
            return true
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
    
    func createAuth(mail:String ,password :String){
        Auth.auth().createUser(withEmail: mail, password: password) {result, error in
            
        }
        
        
    }
}
