//
//  ViewController.swift
//  EyelidDivination-ios
//
//  Created by mac on 2021/12/29.
//

import UIKit
import RxSwift
import RxCocoa
import FirebaseAuth
class ViewController: BaseViewController {

    @IBOutlet weak var memberButton: UIButton!
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        memberButton.rx.tap.subscribe(onNext:{
            self.setJump(type:"login")
            
        }).disposed(by: disposeBag)
        
        FirebaseDatabaseManager.checkMemberDate()
     }
        

        
    }

    
    
    
         



