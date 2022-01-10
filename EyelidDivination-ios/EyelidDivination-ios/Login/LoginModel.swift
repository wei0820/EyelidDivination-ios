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
    func setOnClick(onClickObservable: Observable<Void>){
        onClickObservable.subscribe(onNext:{
            
            
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
    func createAuth(mail:String ,password :String){
        Auth.auth().createUser(withEmail: mail, password: password) {result, error in
            
        }
    
        
        
    }
    
    
}
