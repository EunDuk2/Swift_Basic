//
//  ViewController.swift
//  SubmitValue-UserDefaults
//
//  Created by EUNSUNG on 2023/02/15.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var resultEmail: UILabel!
    
    @IBOutlet var resultUpdate: UILabel!
    
    @IBOutlet var resultInterval: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        // UserDefaults 객체의 인스턴스를 가져온다
        let ud = UserDefaults.standard
        
        if let email = ud.string(forKey: "email") {
            resultEmail.text = email
        }
        let update = ud.bool(forKey: "isUpdate")
        resultUpdate.text = (update == true ? "자동갱신" : "자동갱신안함")
        
        let interval = ud.double(forKey: "interval")
        resultInterval.text = "\(Int(interval)) 분마다"
    }

}

