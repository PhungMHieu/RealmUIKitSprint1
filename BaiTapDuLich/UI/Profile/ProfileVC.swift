//
//  ProfileVC.swift
//  TestThuDelegate
//
//  Created by iKame Elite Fresher 2025 on 30/6/25.
//

import UIKit
protocol ProfileDelegate: AnyObject{
    func getUpdateProfile(_ userProfile: UserProfile)
}
protocol ProfileDeleteDelegate: AnyObject{
    func deleteProfile(_ index:Int)
}
class ProfileVC: UIViewController {

    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var genderRes: UILabel!
    @IBOutlet weak var heightRes: UILabel!
    @IBOutlet weak var weightRes: UILabel!
    @IBOutlet weak var bmi: UILabel!
    @IBOutlet weak var fullName: UILabel!
    
    @IBOutlet var profileView: UIView!
    var fullNameText: String = ""
    var heightText: String = ""
    var weightText: String = ""
    var bmiText: String = ""
    var genderText: String = ""
    var userProfile: UserProfile?
    var userIndex: Int!
    
    weak var profileDelegate: ProfileDelegate?
    weak var profileDeleteDelegate: ProfileDeleteDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if userProfile == nil{
            let informationVC = InformationVC()
            informationVC.userProfile = self.userProfile
            informationVC.informationDelegate = self
            navigationController?.pushViewController(informationVC, animated: true)
//            navigationController?.popViewController(animated: true)
        }
//        UITableView.headerView(/*<#T##self: UITableView##UITableView#>*/)
        editBtn.layer.cornerRadius = 16
        fullName.text = userProfile?.fullName
        genderRes.text = userProfile?.gender.rawValue
        if let heightValue = userProfile?.height{
            heightRes.text = String(heightValue)
        }
        if let weightValue = userProfile?.weight{
            weightRes.text = String(weightValue)
        }
        if let bmiValue = userProfile?.calculateBMI(){
            bmi.text = String(bmiValue)
        }
        title = "Profile"
        let removeButton = UIBarButtonItem(image: UIImage(systemName: "trash.fill"), style: .plain, target: self, action: #selector(didTapRemove))
        removeButton.tintColor = .primary
        navigationItem.rightBarButtonItem = removeButton
//        genderRes.text = userProfile?.gender.
        // Do any additional setup after loading the view.
    }
    @IBAction func updateBtn(_ sender: UIButton) {
        let informationVC = InformationVC()
        informationVC.mode = .update
        informationVC.userProfile = userProfile
        informationVC.informationUpdateDelegate = self
//        informationVC.
        navigationController?.pushViewController(informationVC, animated: true)
    }
    func config(_ userProfile: UserProfile){
        self.userProfile = userProfile
        self.fullNameText = userProfile.fullName
        self.bmiText = String(Int(userProfile.calculateBMI()))
//        print(userProfile.bmi)
        self.heightText = String(userProfile.height)
        self.weightText = String(userProfile.weight)
        self.genderText = userProfile.gender.rawValue
        print(userProfile.fullName)
    }
    func updateUI(){
        fullName.text = userProfile?.fullName
        if let heightValue = userProfile?.height{
            heightRes.text = String(heightValue)
        }
        if let weightValue = (userProfile?.weight){
            weightRes.text = String(weightValue)
        }
//        heightRes.text = userProfile?.height
//        weightRes.text = (userProfile?.weight)
        genderRes.text = (userProfile?.gender.rawValue)
        if let bmiValue = (userProfile?.calculateBMI()){
            bmi.text = String(bmiValue)
        }
//        bmi.text = (userProfile?.calculateBMI())
    }
    @objc func didTapRemove(){
//        let alertVC = CustomAlerVC()
//        alertVC.userIndex = userIndex
//        alertVC.deleteProfile = { [weak self](userIndex) in
//            self?.profileDeleteDelegate?.deleteProfile(userIndex)
//            self?.navigationController?.popViewController(animated: true)
//        }
//        alertVC.userIndex = userIndex
//        definesPresentationContext = true
//        present(alertVC, animated: true)
        
//        self.profileDeleteDelegate?.deleteProfile(self.userIndex)
//        let deleteAction = CustomAlerVC().customPopUPV
//        let alert = UIAlertController(title: "Delete profile", message: "Are you sure, you want to delete", preferredStyle: .alert)
//        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { (_) in
//            self.profileDeleteDelegate?.deleteProfile(self.userIndex)
//            self.navigationController?.popViewController(animated: true)
//        }
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//        alert.addAction(deleteAction)
//        alert.addAction(cancelAction)
//        present(alert, animated: true)
    }
}
extension ProfileVC: InformationUpdateDelegate{
    func didUpdateUser(_ user: UserProfile) {
//        self.userProfile = user
        updateUI()
        profileDelegate?.getUpdateProfile(user)
    }
}
extension ProfileVC: InformationDelegate{
    func didAddUserProfile(_ userProfile: UserProfile) {
        self.userProfile = userProfile
        self.profileDelegate?.getUpdateProfile(userProfile)
        updateUI()
//        profileDelegate?.getUpdateProfile(userProfile)
    }
}
