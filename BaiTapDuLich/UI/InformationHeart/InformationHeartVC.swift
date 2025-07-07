//
//  InformationHeartVC.swift
//  BaiTapDuLich
//
//  Created by iKame Elite Fresher 2025 on 7/7/25.
//

import UIKit

class InformationHeartVC: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var hrvV: LabelTextFieldV!
    @IBOutlet weak var pulseV: LabelTextFieldV!
    
    var addIndex: ((Index)->Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Information"
        button.layer.cornerRadius = 16
        pulseV.config(label: "Pulse", textField: "bpm")
        hrvV.config(label: "Hrv", textField: "bpm")
        // Do any additional setup after loading the view.
    }

    @IBAction func saveAction(_ sender: Any) {
        guard let hrv = hrvV.textField.text else { return  }
        guard let pulse = pulseV.textField.text else { return  }
        guard let hrVInt = Int(hrv) else { return  }
        guard let pulseInt = Int(pulse) else { return }
        let index = Index(pulse: pulseInt, hrv: hrVInt)
        addIndex?(index)
        navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
