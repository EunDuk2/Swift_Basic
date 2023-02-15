//
//  ViewController.swift
//  SubmitValue-AppDelegate
//
//  Created by EUNSUNG on 2023/02/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var resultEmail: UILabel!
    
    @IBOutlet var resultUpdate: UILabel!
    
    @IBOutlet var resultinterval: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        // AppDelegate 객체의 인스턴스를 가져온다.
        let ad = UIApplication.shared.delegate as? AppDelegate
        
        if let email = ad?.paramEmail {
            resultEmail.text = email
        }
        if let update = ad?.paramUpdate {
            resultUpdate.text = update==true ? "자동갱신" : "자동갱신안함"
        }
        if let interval = ad?.paramInterval {
            resultinterval.text = "\(Int(interval))"
        }
    }
}

