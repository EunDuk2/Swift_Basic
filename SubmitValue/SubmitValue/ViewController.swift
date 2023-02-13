//
//  ViewController.swift
//  SubmitValue
//
//  Created by EUNSUNG on 2023/02/12.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var email: UITextField!
    
    @IBOutlet var isUpdate: UISwitch!
    
    @IBOutlet var interval: UIStepper!
    
    @IBOutlet var isUpdqteText: UILabel!
    
    @IBOutlet var intervalText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onSwitch(_ sender: UISwitch) {
        if (sender.isOn == true) {
            self.isUpdqteText.text = "갱신함"
        } else {
            self.isUpdqteText.text = "갱신하지 않음"
        }
    }
    
    @IBAction func onStepper(_ sender: UIStepper) {
        let value = Int(sender.value)
        self.intervalText.text = "\(value) 분 마다"
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        // VC2 인스턴스 생성
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "RVC") as? ResultViewController else {
            
            return
        }
        
        // 값을 전달하는 과정을 여기에 작성
        rvc.paramEmail = self.email.text!
        rvc.paramUpdate = self.isUpdate.isOn
        rvc.paramInterval = self.interval.value
        
        // 화면 이동 프레젠트
        //self.present(rvc, animated: true)
        // 화면 이동 네비게이션
        self.navigationController?.pushViewController(rvc, animated: true)
    }
    
    // 세그웨이를 통해 화면전환 및 값 전달
    @IBAction func onPerformSegue(_ sender: Any) {
        self.performSegue(withIdentifier: "ManualSubmit", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 목적지 뷰 컨트롤러 인스턴스 읽어오기
        let dest = segue.destination
        
        guard let rvc = dest as? ResultViewController else {
            return
        }
        
        // 값 전달
        rvc.paramEmail = self.email.text!
        rvc.paramUpdate = self.isUpdate.isOn
        rvc.paramInterval = self.interval.value
    }
}

