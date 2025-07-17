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
class ProfileVC: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var genderRes: UILabel!
    @IBOutlet weak var heightRes: UILabel!
    @IBOutlet weak var weightRes: UILabel!
    @IBOutlet weak var bmi: UILabel!
    @IBOutlet weak var fullName: UILabel!
    
    @IBOutlet weak var userProfileV: UIView!
    @IBOutlet var profileView: UIView!
    var fullNameText: String = ""
    var heightText: String = ""
    var weightText: String = ""
    var bmiText: String = ""
    var genderText: String = ""
    var userProfile: UserProfile?
    var userIndex: Int!
    
    weak var profileDelegate: ProfileDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: .icLeft2, style: .plain, target: self, action: #selector(didTapBack))
        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(didTapBack))
        edgePan.edges = .left
        view.addGestureRecognizer(edgePan)

        self.userProfileV.layer.cornerRadius = 16
        self.userProfileV.clipsToBounds = true
        fullName.text = userProfile?.fullName
        genderRes.text = userProfile?.gender.rawValue.capitalized
        
        if let heightValue = userProfile?.height{
            heightRes.text = String(Int(heightValue))
        }
        if let weightValue = userProfile?.weight{
            weightRes.text = String(Int(weightValue))
        }
        if let bmiValue = userProfile?.calculateBMI(){
            bmi.text = String(bmiValue)
        }
        title = "Profile"
        let updateButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(didTapUpdate))
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = 24
        paragraphStyle.maximumLineHeight = 24
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.semibold),
            .paragraphStyle: paragraphStyle
        ]
        updateButton.setTitleTextAttributes(attributes, for: .normal)
        updateButton.tintColor = .primary1
        navigationItem.rightBarButtonItem = updateButton
        
        profileDelegate?.getUpdateProfile(userProfile!)
    }
    
    func config(_ userProfile: UserProfile){
        self.userProfile = userProfile
        self.fullNameText = userProfile.fullName
        self.bmiText = String(Int(userProfile.calculateBMI()))
        self.heightText = String(userProfile.height)
        self.weightText = String(userProfile.weight)
        self.genderText = userProfile.gender.rawValue
        print(userProfile.fullName)
    }
    func updateUI(){
        fullName.text = userProfile?.fullName
        if let heightValue = userProfile?.height{
            heightRes.text = String(Int(heightValue))
        }
        if let weightValue = (userProfile?.weight){
            weightRes.text = String(Int(weightValue))
        }
        genderRes.text = (userProfile?.gender.rawValue)?.capitalized
        if let bmiValue = (userProfile?.calculateBMI()){
            bmi.text = String(bmiValue)
        }
    }
    
    @objc func didTapBack(){
//        updateUI()
        navigationController?.popToRootViewController(animated: true)
    }
    @objc func didTapUpdate(){
        let informationVC = InformationVC()
        informationVC.mode = .update
        informationVC.userProfile = userProfile
        informationVC.informationUpdateDelegate = self
        navigationController?.pushViewController(informationVC, animated: true)
    }
    @objc func didTapBackForBtn(){
        navigationController?.popViewController(animated: true)
    }
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        true
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
