//
//  UserInfoData.swift
//  EyelidDivination-ios
//
//  Created by mac on 2022/1/11.
//

import Foundation
import FirebaseAuth
import RxCocoa
import RxSwift
import UIKit


class UserInfoData{
    
    let imageURL = "https://bpic.588ku.com/element_origin_min_pic/19/10/09/b5059f4cae87b9acbceb7c3906cd69cc.jpg"
    let imgge : BehaviorRelay<UIImage?> = BehaviorRelay(value: UIImage())
    var uid : BehaviorRelay<String?> = BehaviorRelay(value: String())
    var email : BehaviorRelay<String?> = BehaviorRelay(value: String())
    var displayName : BehaviorRelay<String?> = BehaviorRelay(value: String())
    typealias isLogin = Bool

//    init(user :User){
//        print("MemberCenterViewController",user.uid)
//        uid.accept(user.uid)
//        email.accept(user.email)
//        displayName.accept(user.displayName)
//
//    }
    
    func getUserInfoData(){
        
        let url = URL(string:imageURL)!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
           if let data = data,
              let image = UIImage(data: data) {
              DispatchQueue.main.async {
                  self.imgge.accept(image)
              }
           }
        }
        task.resume()
        
        
        
        if Auth.auth().currentUser != nil {
          // User is signed in.
            let user = Auth.auth().currentUser
            uid.accept("UUID:" + user!.uid)
            email.accept("Email:" + user!.email!)
//            if (!user!.displayName!.isEmpty){
//                displayName.accept("Name:" + user!.displayName!)
//
//            }


            
          // ...
        } else {
          // No user is signed in.
          // ...
        }
        
    }
    
    lazy var userUid = {
        return self.uid.asObservable().map{$0 != nil}.share(replay:1)
    }
    
    
    
}
