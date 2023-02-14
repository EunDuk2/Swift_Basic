//
//  ViewController.swift
//  SubmitValue-Back
//
//  Created by EUNSUNG on 2023/02/14.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var resultEmail: UILabel!
    
    @IBOutlet var resultUpdate: UILabel!
    
    @IBOutlet var resultInterval: UILabel!
    
    var paramEmail:String?
    var paramUpdate:Bool?
    var paramInterval:Double?

    // 화면이 표시될 때마다 실행되는 메소드 //발동안됨
    override func viewWillAppear(_ animated: Bool) {
        if let email = paramEmail { // nil이 아니면 발동
            resultEmail.text = email
        }
        if let update = paramUpdate {
            resultUpdate.text = update==true ? "자동갱신" : "자동갱신안함"
        }
        if let interval = paramInterval {
            resultInterval.text = "\(Int(interval)) 분마다"
        }
    }

    @IBAction func test(_ sender: Any) {
        if let email = paramEmail { // nil이 아니면 발동
            resultEmail.text = email
        }
        if let update = paramUpdate {
            resultUpdate.text = update==true ? "자동갱신" : "자동갱신안함"
        }
        if let interval = paramInterval {
            resultInterval.text = "\(Int(interval)) 분마다"
        }
    }
}

