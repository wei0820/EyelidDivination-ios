//
//  UserInfoData.swift
//  EyelidDivination-ios
//
//  Created by mac on 2022/1/11.
//

import Foundation

class UserInfoData{
    var  uid : String = ""
    var email :String = ""
    var photoURL : URL!
    var displayName : String = ""
    typealias isLogin = Bool
    init(uid: String,email : String ,photoURL : URL,displayName:String){
        self.uid = uid
        self.email = email
        self.photoURL = photoURL
        self.displayName = displayName
    }
    
    
    
}
