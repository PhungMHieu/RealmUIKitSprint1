//
//  HealthGuruVC.swift
//  BaiTapDuLich
//
//  Created by Admin on 5/7/25.
//

import UIKit

class HealthGuruVC: UIViewController {

    @IBOutlet weak var heartView: UIView!
    @IBOutlet weak var emptyView: UIStackView!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateBackground()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        heartView.isUserInteractionEnabled = true
        heartView.addGestureRecognizer(tapGestureRecognizer)
        
//        title = "Health Guru"
        let titleLabel = UILabel()
        titleLabel.text = "Health Guru"
        titleLabel.textColor = .neutral1
        titleLabel.font = .systemFont(ofSize: 32, weight: .bold)
        titleLabel.sizeToFit()
        let leftItem = UIBarButtonItem(customView: titleLabel)
        self.navigationItem.leftBarButtonItem = leftItem
//        title.alignment(to: .leading)
//        title.al
        // Do any additional setup after loading the view.
    }
    var data:[CustomIndex] = []
    func updateBackground(){
        if(data.isEmpty){
            tableView.isHidden = true
            emptyView.isHidden = false
        }else{
            tableView.isHidden = false
            emptyView.isHidden = true
        }
    }
    @objc func handleTap() {
        let vc = InformationVC()
        navigationController?.pushViewController(vc, animated: true)
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
