//
//  SettingsVC.swift
//  BaiTapDuLich
//
//  Created by Admin on 6/7/25.
//

import UIKit

class SettingsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var data: [[Setting]] = [
        [Setting(image: "icProfileCircle", title: "Profile")],
        [Setting(image: "icNotification", title: "Daily Reminder"),
         Setting(image: "icCategory", title: "Change App Icon"),
         Setting(image: "icWebsite", title: "Language")],
        [Setting(image: "icLike", title: "Rate us"),
         Setting(image: "icMessage37", title: "Feedback"),
         Setting(image: "icShieldStar", title: "Privacy Policy"),
         Setting(image: "icDocumentAlignRight", title: "Term of User")]
    ]
    var userProfile: UserProfile?
    
    @IBOutlet weak var tableView: UITableView!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! SettingsCell
        cell.config(setting: data[indexPath.section][indexPath.row])
        let numberOfRows = tableView.numberOfRows(inSection: indexPath.section)
        if (indexPath.row == numberOfRows - 1){
            cell.setSepearatorLine(isHidden: true)
        }
        return cell;
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        .init()
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.section == 0 && indexPath.row == 0){
            
            if(userProfile == nil){
                let vc = InformationVC()
                vc.informationUpdateDelegate = self
                vc.hidesBottomBarWhenPushed = true
                navigationController?.pushViewController(vc, animated: true)
            }else{
                let vc = ProfileVC()
                vc.userProfile = self.userProfile
                vc.hidesBottomBarWhenPushed = true
                navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let numberOfRows = tableView.numberOfRows(inSection: indexPath.section)
        let isFirst = indexPath.row == 0
        let isLast  = indexPath.row == numberOfRows - 1
        if #available(iOS 11.0, *) {
            cell.contentView.layer.cornerRadius = 12
            cell.contentView.layer.masksToBounds = true
            
            if isFirst && isLast {
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
        titleLabel.font = .systemFont(ofSize: 32, weight: .semibold)
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
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 104))
        let imageView = UIImageView(image: .icLabelPremium)
        imageView.frame = headerView.bounds
        imageView.layer.cornerRadius = 16
        imageView.contentMode = .scaleAspectFill
//        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        headerView.addSubview(imageView)
        tableView.tableHeaderView = headerView
    }
}

extension SettingsVC: InformationUpdateDelegate{
    func didUpdateUser(_ user: UserProfile) {
        self.userProfile = user
    }
}
