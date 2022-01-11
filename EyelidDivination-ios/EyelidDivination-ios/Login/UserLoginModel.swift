//
//  UserLoginModel.swift
//  EyelidDivination-ios
//
//  Created by mac on 2022/1/10.
//

import Foundation
import RxSwift
import RxCocoa
import Firebase
import FirebaseAuth

class UserloginModel{
    
    let disposeBag = DisposeBag()
    var email : String = ""
    var password : String = ""
    var userInfoDataBehaviorRelay  : BehaviorRelay<UserInfoData>!
    var userInfonData :  UserInfoData!
    func setUserMail(userMail : Observable<String>){
        
        userMail.subscribe(onNext:{
            string in
                self.email = string
        }).disposed(by: disposeBag)
        
    }
    
    func setUserPassword(userPassword : Observable<String>){
        userPassword.subscribe(onNext:{
            string in
                self.password = string
        }).disposed(by: disposeBag)
        
        
        
        
    }
    
    
    
    
    func setuserLogin(userlogin : Observable<Void>,view :UIViewController){
        userlogin.subscribe(onNext:{ [self] in
            Auth.auth().signIn(withEmail: self.email, password: self.password) { [weak self] authResult, error in
              guard let strongSelf = self else { return }
                if(authResult?.user != nil){
                    view.dismiss(animated: true, completion: nil)

                }else{
                    print("UserloginModel","no")
                    print("UserloginModel",error?.localizedDescription)

                }
            }
            
            
        }).disposed(by: disposeBag)
        
        
        
    }
    
    func getUser(){
        let user = Auth.auth().currentUser
        
        if let user = user {
            userInfonData  = UserInfoData(uid: user.uid, email: user.email!, photoURL: user.photoURL!,displayName: user.displayName!)
            
            userInfoDataBehaviorRelay.accept(userInfonData)
        }
    }
    
}
