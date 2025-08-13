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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Information"
        button.layer.cornerRadius = 16
        pulseV.config(label: "Pulse", textField: "bpm")
        hrvV.config(label: "HRV", textField: "bpm")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(didTapClose))
        navigationItem.leftBarButtonItem?.tintColor = .neutral2
    }
    
    @IBAction func saveAction(_ sender: Any) {
        guard let hrv = hrvV.textField.text else { return  }
        guard let pulse = pulseV.textField.text else { return  }
        guard let hrVInt = Int(hrv) else { return  }
        guard let pulseInt = Int(pulse) else { return }
        if(hrVInt < 300 && pulseInt < 300){
            let index = Index(pulse: pulseInt, hrv: hrVInt)
            RealmManager.shared.save(object: index)
            print(index)
            dismiss(animated: true)
        }
    }
    @objc func didTapClose(){
        dismiss(animated: true)
    }
}
