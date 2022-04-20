//
//  ListViewController.swift
//  Chapter5-UserDefaults
//
//  Created by 한규철 on 4/8/R4.
//

import UIKit

class ListViewController : UITableViewController {
    
    @IBOutlet var name: UILabel!
    @IBOutlet var gender: UISegmentedControl!
    @IBOutlet var company: UISwitch!
    
    @IBAction func edit(_ sender: UITapGestureRecognizer) {
        let alert = UIAlertController(title: nil, message: "이름을 입력하세요", preferredStyle: .alert)
        
        alert.addTextField() {
            $0.text = self.name.text
        }
        
        alert.addAction(UIAlertAction(title: "OK", style: .default) {(_) in
            let value = alert.textFields?[0].text
            
            let plist = UserDefaults.standard
            plist.setValue(value, forKey: "name")
            plist.synchronize()
            
            self.name.text = value
        })
        self.present(alert, animated: false, completion: nil)
    }
    
    
    @IBAction func changeGender(_ sender: UISegmentedControl) {
        let value = sender.selectedSegmentIndex // 0이면 남자, 1이면 여자
        
        let plist = UserDefaults.standard //기본 저장소 객체를 가져온다.
        plist.set(value, forKey:"gender") //gender 라는 키로 값을 저장한다.
        plist.synchronize() //동기화
        
    }
    @IBAction func changeCompany(_ sender: UISwitch) {
        let value = sender.isOn //true, false
        
        let plist = UserDefaults.standard //기본 저장소 객체를 가져온다.
        plist.set(value, forKey: "company") //키로 값을 저장
        plist.synchronize() //동기화 처리
    }
    
    //사용자가 테이블 뷰 셀을 선택했을때 호출되는 메소드
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                            //어느테이블 뷰가 호출했지?        //어느 셀을 선택했지?
                            //호출한 테이블 뷰에 대한 정보      //선택된 셀에 대한 정보
        
//        if indexPath.row == 0 { //첫번째 셀이 클릭되었을 떄에만
//            //입력이 가능한 알림창을 띄워 이름을 수정할 수 있도록 한다.
//            let alert = UIAlertController(title: nil, message: "이름을 입력하세요", preferredStyle: .alert)
//
//            //입력 필드 추가
//            alert.addTextField() {
//                $0.text = self.name.text // name 레이블의 텍스트를 입력폼에 기본값으로 넣어준다.
//
//            }
//            //버튼 및 액션 추가
//            alert.addAction(UIAlertAction(title: "OK", style: .default) {(_) in
//                //사용자가 ok버튼을 누르면 입력필드에 입력된 값을 저장한다.
//                let value = alert.textFields?[0].text
//
//                let plist = UserDefaults.standard
//                plist.setValue(value, forKey: "name")
//                plist.synchronize()
//
//                //변경된 값을 이름 레이블에도 적용한다.
//                self.name.text = value
//            })
//
//            //알림창을 띄운다.
//            self.present(alert, animated: false, completion: nil)
//        }
        
    }
    
    override func viewDidLoad() {
        let plist = UserDefaults.standard
        
        //저장소 값을 꺼내어 각 컨트롤에 설정한다.
        self.name.text = plist.string(forKey: "name")   //이름
        self.company.isOn = plist.bool(forKey: "company")
        self.gender.selectedSegmentIndex = plist.integer(forKey: "gender")  //성별
        
        
    }
    
    
    
    
}
