//
//  Trang1VC.swift
//  BaiTapDuLich
//
//  Created by Admin on 3/7/25.
//

import UIKit

class Trang1VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func `continue`(_ sender: Any) {
        let trang2 = Trang2VC()
        navigationController?.pushViewController(trang2, animated: true)
    }
}
