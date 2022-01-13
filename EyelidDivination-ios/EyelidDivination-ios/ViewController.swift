//
//  ViewController.swift
//  EyelidDivination-ios
//
//  Created by mac on 2021/12/29.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: BaseViewController {

    @IBOutlet weak var memberButton: UIButton!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        memberButton.rx.tap.subscribe(onNext:{
            self.setJump(type:"member")
            
        }).disposed(by: disposeBag)
        
    
    }

    
    
    
         

}

