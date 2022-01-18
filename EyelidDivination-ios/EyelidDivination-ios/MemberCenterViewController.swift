//
//  MemberCenterViewController.swift
//  EyelidDivination-ios
//
//  Created by mac on 2022/1/5.
//

import UIKit
import RxSwift
import RxRelay
import RxGesture
import FirebaseAuth

class MemberCenterViewController: BaseViewController {


    @IBOutlet weak var userImage: UIImageView!
    let disposeBag = DisposeBag()
    let userInfoData = UserInfoData()

    @IBOutlet weak var changeNameBtn: UIButton!
    @IBOutlet weak var useruuidLabel: UILabel!
    @IBOutlet weak var userMail: UILabel!
    @IBOutlet weak var changeUserMailBtn: UIButton!
    
    
//    var user  : UserInfoData?{
//        didSet{
//            guard let user = user else {
//                return
//            }
//            print("MemberCenterViewController","in")
//            user.uid.asObservable().bind(to: useruuidLabel.rx.text).disposed(by: disposeBag)
//
//        }
//    }
//
    override func viewDidLoad() {
     setData()
    initLayout()

    }
    
    
    func initLayout(){
        changeUserMailBtn.rx.tap.subscribe(onNext:{
            
            
            let newuser = Auth.auth().currentUser
            let credential = EmailAuthProvider.credential(withEmail: (newuser?.email)!, password: "12345678")

            newuser?.reauthenticate(with: credential, completion: { result, error in
                if let error = error {
                  // An error happened.
                } else {
                    Auth.auth().currentUser?.updateEmail(to: "123987666@gmail.com") { error in
                        
                        self.userInfoData.email.accept(newuser?.email)
                    }
                    
                }
            })
            
            
            
            
       
            
        }).disposed(by: disposeBag)

    }
    
    func setData(){
        userInfoData.getUserInfoData()
        userInfoData.imgge.asObservable().bind(to: userImage.rx.image).disposed(by:disposeBag)
        userInfoData.uid.asObservable().bind(to: useruuidLabel.rx.text).disposed(by: disposeBag)
        userInfoData.email.bind(to: userMail.rx.text).disposed(by: disposeBag)

        
    }
    
    
    
    
    @objc func setJumpViewController(){
          
    
          
      }

    
    

}
