//
//  UIManager.swift
//  EyelidDivination-ios
//
//  Created by mac on 2022/1/21.
//

import Foundation
import UIKit
import RxSwift
import RxRelay


class UIManager{
    
    
    static func stringToUImage(string : String,imageBehaviorRelay : BehaviorRelay<UIImage?>){
        //dictionaryData["userUrl"] as! String
        let url = URL(string:string)!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
           if let data = data,
              let image = UIImage(data: data) {
              DispatchQueue.main.async {                   
                  imageBehaviorRelay.accept(image)
              }
           }
        }
        task.resume()
    }
}
