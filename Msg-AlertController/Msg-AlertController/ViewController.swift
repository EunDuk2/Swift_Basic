//
//  ViewController.swift
//  Msg-AlertController
//
//  Created by EUNSUNG on 2023/03/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var result: UILabel!

    @IBAction func alert(_ sender: Any) {
        // 메시지창 객체 생성
        let alert = UIAlertController(title: "선택", message: "항목을 선택해주세요", preferredStyle: .alert)
        
        // 취소버튼
        let cancel = UIAlertAction(title: "취소", style: .cancel) { (_) in
            self.result.text = "취소 버튼을 클릭했습니다."
        }
        // 확인 버튼
        let ok = UIAlertAction(title: "확인", style: .default) { (_) in
            self.result.text = "확인 버튼을 클릭했습니다."
        }
        // 실행 버튼
        let exec = UIAlertAction(title: "실행", style: .destructive) { (_) in
            self.result.text = "실행 버튼을 클릭했습니다."
        }
        // 중지 버튼
        let stop = UIAlertAction(title: "중지", style: .default) { (_) in
            self.result.text = "중지 버튼을 클릭했습니다."
        }
        
        // 버튼을 컨트롤러에 등록
        alert.addAction(cancel)
        alert.addAction(ok)
        alert.addAction(exec)
        alert.addAction(stop)
        
        // 메시지 창 실행
        self.present(alert, animated: true)
    }
    
    @IBAction func login(_ sender: Any) {
        let title = "iTunes Store에 로그인"
        let message = "사용자의 Apple ID sqlpro@naver.com의 암오를 입력하십시오"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: "확인", style: .default) { (_) in
            // 확인 버튼을 클릭했을 때 처리할 내용
            if let tf = alert.textFields?[0] {
                print("입력된 값은 \( tf.text! ) 입니다. ")
                //self.result.text = tf.text!
            } else {
                print("입력된 값이 없습니다.")
            }
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        
        // 텍스트 필드 추가 // 텍스트필드 속성 안줘도 되면 configurationHandler 빼고 ()로 처리
        alert.addTextField(configurationHandler: { (tf) in
            // 텍스트필드의 속성 설정
            tf.placeholder = "암호" // 안내 메시지
            tf.isSecureTextEntry = true // 비밀번호 처리
        })
        
        self.present(alert, animated: false)
    }
    
}

