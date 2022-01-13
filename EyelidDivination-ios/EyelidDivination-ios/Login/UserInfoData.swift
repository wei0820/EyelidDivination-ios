//
//  UserInfoData.swift
//  EyelidDivination-ios
//
//  Created by mac on 2022/1/11.
//

import Foundation
import RxSwift
import RxCocoa
class UserInfoData{
    
    
    var uid : BehaviorRelay<String?> = BehaviorRelay(value: String())
    var email : BehaviorRelay<String?> = BehaviorRelay(value: String())
    var displayName : BehaviorRelay<String?> = BehaviorRelay(value: String())
    typealias isLogin = Bool

    
    
    
}
