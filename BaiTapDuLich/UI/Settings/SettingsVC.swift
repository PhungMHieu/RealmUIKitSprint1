//
//  SettingsVC.swift
//  BaiTapDuLich
//
//  Created by Admin on 6/7/25.
//

import UIKit

class SettingsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! SettingsCell
        cell.config(setting: data[indexPath.section][indexPath.row])
//        cell.accessoryType = .disclosureIndicator
        cell.layer.cornerRadius = 12
        return cell;
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count;
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
//        headerView.
//        headerView.backgroundColor = .clear
        tableView.backgroundColor = .clear
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 16
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.section == 0 && indexPath.row == 0){
//            let vc = InformationVC()
            let vc = ProfileVC()
//            self.userProfile = UserProfile(firstName: "---", lastName: "---", weight: 1, height: 1, gender: .male)
            vc.userProfile = self.userProfile
            vc.profileDelegate = self
//            self.userProfile = vc.userProfile
//            if(vc.has)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        switch section {
//        case 0: return ""
//        case 1: return ""
//        case 2: return ""
//        default: return nil
//        }
//
//    }
//    
    var data: [[Setting]] = [
        [Setting(image: "Profile Circle", title: "Profile")],
        [Setting(image: "Notification", title: "Daily Reminder"),
         Setting(image: "Category", title: "Change App Icon"),
         Setting(image: "Website", title: "Language")],
        [Setting(image: "Like", title: "Rate us"),
         Setting(image: "Message 37", title: "Feedback"),
         Setting(image: "Shield Star", title: "Privacy Policy"),
         Setting(image: "Document Align Right", title: "Term of User")]
    ]
    var userProfile: UserProfile?
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let titleLabel = UILabel()
        titleLabel.text = "Settings"
        titleLabel.textColor = .neutral1
        titleLabel.font = .systemFont(ofSize: 32, weight: .bold)
        titleLabel.sizeToFit()
        let leftItem = UIBarButtonItem(customView: titleLabel)
        self.navigationItem.leftBarButtonItem = leftItem
        let nib = UINib(nibName: "SettingsCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
//        let headerView = RateIndexV()
//        headerView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
//        headerView.hrv.translatesAutoresizingMaskIntoConstraints = false
//        headerView.hrv.heightAnchor.constraint(equalToConstant: 1).isActive = true
//        tableView.tableHeaderView = headerView
        // Do any additional setup after loading the view.
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
extension SettingsVC: ProfileDelegate{
    func getUpdateProfile(_ userProfile: UserProfile) {
        self.userProfile = userProfile
    }
}
