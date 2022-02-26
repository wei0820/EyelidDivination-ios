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
import Firebase
import FirebaseDatabase

class UserInfoData{
    
    let imageURL = "https://bpic.588ku.com/element_origin_min_pic/19/10/09/b5059f4cae87b9acbceb7c3906cd69cc.jpg"
    let imgge : BehaviorRelay<UIImage?> = BehaviorRelay(value: UIImage())
    var uid : BehaviorRelay<String?> = BehaviorRelay(value: String())
    var email : BehaviorRelay<String?> = BehaviorRelay(value: String())
    var displayName : BehaviorRelay<String?> = BehaviorRelay(value: String())
    var userPhone : BehaviorRelay<String?> = BehaviorRelay(value: String())
    typealias isLogin = Bool

//    init(user :User){
//        print("MemberCenterViewController",user.uid)
//        uid.accept(user.uid)
//        email.accept(user.email)
//        displayName.accept(user.displayName)
//
//    }
    
    func getUserInfoData(){
        if Auth.auth().currentUser != nil {
          // User is signed in.
            let user = Auth.auth().currentUser
            // 查詢節點資料
            Database.database().reference().child("UserData").child(user?.uid as! String).observe(.value, with: {
                        (snapshot) in
                        print("getUserInfoData","in")

                        // childAdded逐筆呈現
                        if let dictionaryData = snapshot.value as? [String: AnyObject]{

                            if( dictionaryData["id"]  != nil){
                                self.uid.accept( dictionaryData["id"] as! String)
                                print("getUserInfoData",dictionaryData["id"] as! String)

                                     }
                            if( dictionaryData["mail"]  != nil){
                                self.email.accept( dictionaryData["mail"] as! String)

                                     }
                            if( dictionaryData["name"]  != nil){
                                self.displayName.accept(dictionaryData["name"] as! String)
                                         
                                     }
                            if( dictionaryData["phone"]  != nil){
                                self.userPhone.accept(dictionaryData["phone"] as! String)
                                         
                                     }
                            if( dictionaryData["userUrl"]  != nil){
                                
                                UIManager.stringToUImage(string: dictionaryData["userUrl"] as! String, imageBehaviorRelay: self.imgge)
                                
//                                let url = URL(string:dictionaryData["userUrl"] as! String)!
//                                let task = URLSession.shared.dataTask(with: url) { data, response, error in
//
//                                   if let data = data,
//                                      let image = UIImage(data: data) {
//                                      DispatchQueue.main.async {
//                                          self.imgge.accept(image)
//                                      }
//                                   }
//                                }
//                                task.resume()

                            }
                
                        }
                        
                    }, withCancel: nil)
            
            
        
        }else{
            
            UIManager.stringToUImage(string: imageURL, imageBehaviorRelay: self.imgge)
        }
        
      
        
        
        
        
        
    }
    
    lazy var userUid = {
        return self.uid.asObservable().map{$0 != nil}.share(replay:1)
    }
 
    
    
}
