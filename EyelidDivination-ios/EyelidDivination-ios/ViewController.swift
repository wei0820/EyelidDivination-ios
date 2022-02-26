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
    
    @IBOutlet weak var selectButton: UIButton!
    
    @IBOutlet weak var quictButton: UIButton!
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        FirebaseDatabaseManager.checkMemberDate()

        initLayout()
    
    func initLayout(){
        memberButton.rx.tap.subscribe(onNext:{
            self.setJump(type:"login")
            
        }).disposed(by: disposeBag)
        
        selectButton.rx.tap.subscribe(onNext:{
            
            self.setJump(type:"select")

            
        }).disposed(by: disposeBag)
        
        quictButton.rx.tap.subscribe(onNext:{
            self.setJump(type:"quict")

            
        }).disposed(by: disposeBag)
        
        
     }
    }
        

        
    }

    
    
    
         



