//
//  LoginModel.swift
//  EyelidDivination-ios
//
//  Created by mac on 2022/1/7.
//

import Foundation
import RxSwift
import RxCocoa
import Firebase
import FirebaseAuth
import RxSwiftExt

class LoginModel{

    private let bag = DisposeBag()
    var userMail = ""
    var userPassword = ""
    
    
    func setUserMail(stringObservable: Observable<String>){
        stringObservable.subscribe(onNext: { string in
            self.userMail = string

        })
        .disposed(by: bag)
        
    }
    
    func setUserPassword(passwordObservable: Observable<String>){
        passwordObservable.subscribe(onNext:{
            
            string  in
            self.userPassword = string
        }).disposed(by: bag)
        
    }
    func createUser(onClickObservable: Observable<Void>,view : UIViewController){
        onClickObservable.subscribe(onNext:{
            
            Auth.auth().createUser(withEmail: self.userMail, password: self.userPassword) {result, error in
                print("LoginModel",self.userMail)
                print("LoginModel",self.userPassword)
                print("LoginModel",result)

                print("LoginModel",error.debugDescription)

                view.dismiss(animated: true, completion: nil)

                
            }
    
            
        }).disposed(by: bag)
        
    }
    
    //Mark
//    let string = BehaviorSubject<String>(value: "")
//
//    init() {
//        string.asObservable().subscribe(onNext: { string in
//            print(string)
//        })
//        .disposed(by: bag)
//    }
//
//    private let bag = DisposeBag()
//    let string = BehaviorSubject<String>(value: "")
//
//    init() {
//        string.asObservable().subscribe(onNext: { string in
//            print(string)
//        })
//        .disposed(by: bag)
//    }


    
    
}
