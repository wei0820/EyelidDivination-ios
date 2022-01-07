//
//  LoginModel.swift
//  EyelidDivination-ios
//
//  Created by mac on 2022/1/7.
//

import Foundation
import RxSwift
import RxCocoa

class LoginModel{

    private let bag = DisposeBag()
    var userMail = ""
    
    func setUserMail(stringObservable: Observable<String>){
        stringObservable.subscribe(onNext: { string in
            self.userMail = string
        })
        .disposed(by: bag)
        
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


    
    
    
}
