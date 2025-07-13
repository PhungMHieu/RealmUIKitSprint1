//
//  SettingsVC.swift
//  BaiTapDuLich
//
//  Created by Admin on 6/7/25.
//

import UIKit
//protocol InformationDelegate {
//    
//}
class SettingsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
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

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! SettingsCell
        cell.config(setting: data[indexPath.section][indexPath.row])
//        cell.accessoryType = .disclosureIndicator
        cell.layer.cornerRadius = 12
//        cell.heightAnchor = 
        cell.selectionStyle = .none
//        cell.separatorß
        let numberOfRows = tableView.numberOfRows(inSection: indexPath.section)
        cell.seperatorLineV.isHidden = (indexPath.row == numberOfRows - 1)
        return cell;
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        .init()
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        if(indexPath.section == 0 && indexPath.row == 0){
        ////            let vc = InformationVC()
        //            let vc = ProfileVC()
        ////            self.userProfile = UserProfile(firstName: "---", lastName: "---", weight: 1, height: 1, gender: .male)
        //            vc.userProfile = self.userProfile
        //            vc.profileDelegate = self
        ////            self.userProfile = vc.userProfile
        ////            if(vc.has)
        //            navigationController?.pushViewController(vc, animated: true)
        //        }
        if(indexPath.section == 0 && indexPath.row == 0){
            
            if(userProfile == nil){
                let vc = InformationVC()
                vc.informationUpdateDelegate = self
//                vc2.informationDelegate = self
//                vc2.informationDelegate = self
//                vc2.informationDelegate
                vc.hidesBottomBarWhenPushed = true
                navigationController?.pushViewController(vc, animated: true)
            }else{
                let vc = ProfileVC()
                vc.userProfile = self.userProfile
                vc.hidesBottomBarWhenPushed = true
//                vc.profileDelegate = self
                navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let numberOfRows = tableView.numberOfRows(inSection: indexPath.section)
//        if(indexPath.row == numberOfRows - 1){
////            cell.contentView.seperatorLineV.isHidden = true
//            cell.seperatorLineV.isHidden = true
////            cell.contentView.seperatorLineV.isHidden = true
//        }
//        if(indexPath.row == 0 || indexPath.row == numberOfRows){
//            cell.separatorInset = UIEdgeInsets(top: 0, left: cell.bounds.size.width, bottom: 0, right: 0)
//        }else{
//            cell.separatorInset = UIEdgeInsets.zero
//        }
        let isFirst = indexPath.row == 0
        let isLast  = indexPath.row == numberOfRows - 1
        if #available(iOS 11.0, *) {
            cell.contentView.layer.cornerRadius = 12
//            cell.clipsToBounds = true
            cell.contentView.layer.masksToBounds = true
            
            if isFirst && isLast {
                // Section chỉ có 1 cell → bo đủ 4 góc
                cell.contentView.layer.maskedCorners = [
                    .layerMinXMinYCorner, .layerMaxXMinYCorner,
                    .layerMinXMaxYCorner, .layerMaxXMaxYCorner
                ]
            } else if isFirst {
                cell.contentView.layer.maskedCorners = [
                    .layerMinXMinYCorner, .layerMaxXMinYCorner
                ]
            } else if isLast {
                cell.contentView.layer.maskedCorners = [
                    .layerMinXMaxYCorner, .layerMaxXMaxYCorner
                ]
            } else {
                cell.contentView.layer.cornerRadius = 0 // cell ở giữa
            }
        }
    }

    
    
    
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
        tableView.sectionHeaderHeight = 16
        tableView.rowHeight = 56
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
    }
}

extension SettingsVC: InformationUpdateDelegate{
    func didUpdateUser(_ user: UserProfile) {
        self.userProfile = user
    }
}
