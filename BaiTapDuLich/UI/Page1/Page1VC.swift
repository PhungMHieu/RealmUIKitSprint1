//
//  Trang1VC.swift
//  BaiTapDuLich
//
//  Created by Admin on 3/7/25.
//

import UIKit

class Page1VC: UIViewController {

    @IBOutlet weak var detailInfo: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func `continue`(_ sender: Any) {
        let page2 = OnBoardVC()
        navigationController?.pushViewController(page2, animated: true)
    }
}
