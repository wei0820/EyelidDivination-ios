//
//  BaseViewController.swift
//  EyelidDivination-ios
//
//  Created by mac on 2022/1/6.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 13.0, *) {
            
        overrideUserInterfaceStyle = .light
        } else {
            
                 // Fallback on earlier versions
             }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func setJump(type:String){
          
          if let controller = storyboard?.instantiateViewController(withIdentifier: type) {
                     present(controller, animated: true, completion: nil)
                 }
          
      }

}
