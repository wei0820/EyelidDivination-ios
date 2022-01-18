//
//  BaseViewController.swift
//  EyelidDivination-ios
//
//  Created by mac on 2022/1/6.
//

import UIKit
import FirebaseAuth
import RxCocoa
import RxSwift


class BaseViewController: UIViewController {
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 13.0, *) {
            
        overrideUserInterfaceStyle = .light
        } else {
            
                 // Fallback on earlier versions
             }
        
    }
    

    
    
    
    
    
    func setJump(type:String){
          
          if let controller = storyboard?.instantiateViewController(withIdentifier: type) {
                     present(controller, animated: true, completion: nil)
                 }
          
      }

}
