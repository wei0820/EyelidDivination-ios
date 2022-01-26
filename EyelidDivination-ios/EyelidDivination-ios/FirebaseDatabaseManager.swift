//
//  FirebaseDatabaseManager.swift
//  EyelidDivination-ios
//
//  Created by mac on 2022/1/19.
//

import Foundation
import Firebase
import FirebaseDatabase

class FirebaseDatabaseManager{
    
   static  let imageURL = "https://bpic.588ku.com/element_origin_min_pic/19/10/09/b5059f4cae87b9acbceb7c3906cd69cc.jpg"

    static func addUserData(id : String , name :String ,mail :String,
                            userUrl : String,phone : String){
            let reference: DatabaseReference! = Database.database().reference().child("UserData")
                let childRef = reference.childByAutoId() // 隨機生成的節點唯一識別碼，用來當儲存時的key值
                let dateReviewReference = reference.child(id)
                // 新增節點資料
                var dateReview: [String : AnyObject] = [String : AnyObject]()
            
                dateReview["id"] = id as AnyObject
                dateReview["name"] = name as AnyObject
                dateReview["mail"] = mail as AnyObject
                dateReview["uuid"] = getUUID() as AnyObject
                dateReview["key"]  = childRef.key as AnyObject
                dateReview["userUrl"] = userUrl as AnyObject
                dateReview["phone"] = phone as AnyObject

            dateReviewReference.updateChildValues(dateReview) { (err, ref) in
                  if err != nil{
                      print("jack： \(err!)")
                      return
                  }
                  
                  print("jack",ref.description())
              }



        }
        
    
    static  func checkMemberDate(){
          
        
        if Auth.auth().currentUser != nil {
            let user = Auth.auth().currentUser


            // 查詢節點資料
            Database.database().reference().child("UserData").child(user?.uid as! String).observe(.value) { snapshot in
                if let output = snapshot.value as? [String: Any] {
                    print("FirebaseDatabaseManager","目前資料庫內有 \(output.count) 筆")
                } else {
                    print("FirebaseDatabaseManager","目前資料庫內沒有留言！")
                    
                    if Auth.auth().currentUser != nil {
                      // User is signed in.
                        let user = Auth.auth().currentUser
                        let userId =  user?.uid != nil ? user?.uid : ""
                        let usermail =  user?.email != nil ? user?.email : ""
                        let username =  user?.email != nil ? user?.email : ""
                        let userphone =  user?.phoneNumber != nil ? user?.phoneNumber : ""
                        let userphotourl =  user?.photoURL != nil ? user?.photoURL?.absoluteString : imageURL
                        
                        
                        self.addUserData(id: userId!, name: username!, mail: usermail!, userUrl: userphotourl!, phone: userphone!)
                        
                        
                        
                        
          
                    }
                    
                    
                }
            }
            
        }

          
          
      }
    
    static func updateMemberData(){
        
  

        
    }
    
    
    
    
    
        static func getUUID() -> String{
            return UIDevice.current.identifierForVendor?.uuidString ?? UUID().uuidString
        }
    
    
}
