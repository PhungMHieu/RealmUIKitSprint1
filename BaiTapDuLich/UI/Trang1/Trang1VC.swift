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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
