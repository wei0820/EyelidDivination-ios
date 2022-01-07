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
        
        if #available(iOS 13.0, *) {
            
        overrideUserInterfaceStyle = .light
        } else {
            
                 // Fallback on earlier versions
             }
        memberButton.rx.tap.subscribe(onNext:{
            self.setJump(type:"login")
            
        }).disposed(by: disposeBag)
        
    
    }
    func setJump(type:String){
          
          if let controller = storyboard?.instantiateViewController(withIdentifier: type) {
                     present(controller, animated: true, completion: nil)
                 }
          
      }
         

}

