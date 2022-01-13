//
//  MemberCenterViewController.swift
//  EyelidDivination-ios
//
//  Created by mac on 2022/1/5.
//

import UIKit
import RxSwift
import RxRelay

class MemberCenterViewController: BaseViewController {
    let imageURL = "https://bpic.588ku.com/element_origin_min_pic/19/10/09/b5059f4cae87b9acbceb7c3906cd69cc.jpg"
    @IBOutlet weak var userImage: UIImageView!
    let imgge : BehaviorRelay<UIImage?> = BehaviorRelay(value: UIImage())
    
    let eee : Variable<String?> = Variable(String())
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
     setData()
        
        
        
    }
    
    
    func setData(){
        let url = URL(string:imageURL)!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
           if let data = data,
              let image = UIImage(data: data) {
              DispatchQueue.main.async {
                  self.imgge.accept(image)
              }
           }
        }
        task.resume()
        
        
        imgge.asObservable().bind(to: userImage.rx.image).disposed(by:disposeBag)
    
    }
    

    
    

}
