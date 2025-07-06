//
//  InformationVC.swift
//  TestThuDelegate
//
//  Created by Admin on 27/6/25.
//

import UIKit
protocol InformationDelegate: AnyObject{
    func didAddUserProfile(_ userProfile: UserProfile)
}
protocol InformationUpdateDelegate: AnyObject{
    func didUpdateUser(_ user: UserProfile)
}
class InformationVC: UIViewController {
    var hasUser: Bool?
    @IBOutlet weak var heightV: LabelTextFieldV!
    @IBOutlet weak var weightV: LabelTextFieldV!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var lastNameV: LabelTextFieldV!
    @IBOutlet weak var firstNameV: LabelTextFieldV!
    
    var mode: FormMode = .add
    var userProfile: UserProfile?
    weak var informationDelegate: InformationDelegate?
    weak var informationUpdateDelegate: InformationUpdateDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Information"
        heightV.config(label: "Height", textField: "Cm")
        weightV.config(label: "Weight", textField: "Kg")
        firstNameV.config(label: "First name", textField: "Enter first name")
        lastNameV.config(label: "Last name", textField: "Enter last name")
        button.layer.cornerRadius = 16
        //        print(inf)
        if(mode == .update){
            button.titleLabel?.text = "Update"
            if let userProfile{
                firstNameV.textField.text = userProfile.firstName
                lastNameV.textField.text = userProfile.lastName
                heightV.textField.text = String(userProfile.height)
                weightV.textField.text = String(userProfile.weight)
                //                print(type(of: userProfile.gender.rawValue))
                //                print(gender.numberOfSegments)
                for i in 0..<gender.numberOfSegments{
                    print("\(gender.titleForSegment(at: i)) \(userProfile.gender.rawValue)")
                    if(gender.titleForSegment(at: i) == userProfile.gender.rawValue){
                        //                        print("\(gender.titleForSegment(at: i)) \(userProfile.gender.rawValue)")
//                        print(i)
                        gender.selectedSegmentIndex = i
                        break
                    }
                }
            }
        }
        if(mode == .add){
            validateInput()
            for textField in [firstNameV.textField, lastNameV.textField, heightV.textField, weightV.textField]{
                textField?.addTarget(self, action: #selector(textFieldChanged), for:.editingChanged)
            }
            gender.addTarget(self, action: #selector(textFieldChanged), for: .valueChanged)
        }else{
            validateInputUpdate()
            for textField in [firstNameV.textField, lastNameV.textField, heightV.textField, weightV.textField]{
                textField?.addTarget(self, action: #selector(textFieldUpdate), for:.editingChanged)
            }
            gender.addTarget(self, action: #selector(textFieldUpdate), for: .valueChanged)
        }
                // Do any additional setup after loading the view.
    }
    @IBAction func btn(_ sender: Any) {
        if(mode == .add){
            let firstName = firstNameV.textField.text ?? ""
            let lastName = lastNameV.textField.text ?? ""
            let weight = weightV.textField.text ?? "0"
            let height = heightV.textField.text ?? "0"
            let genderIndexPath = gender.selectedSegmentIndex
            let genderString = gender.titleForSegment(at: genderIndexPath) ?? ""
            let selectedGender = Gender(rawValue: genderString)
            //            let selectedGender = Gender(description: genderString)
//            print("\(selectedGender) la gender duoc chon")
            let userProfile = UserProfile(firstName: firstName, lastName: lastName, weight: Double(weight) ?? 0, height: Double(height) ?? 0, gender: selectedGender ?? .male)
            //        var listProfileVC = ListProfileVC()
            //        listProfileVC.data.append(userProfile)
            
            informationDelegate?.didAddUserProfile(userProfile)
//            informationDelegate.didUpdateUser(userProfile)
            //        navigationController?.pushViewController(listProfileVC, animated: true)
            navigationController?.popViewController(animated: true)
        }else{
            let userProfile = self.userProfile
            userProfile?.firstName = firstNameV.textField.text ?? ""
            userProfile?.lastName = lastNameV.textField.text ?? ""
            if let heightValue = heightV.textField.text,
               let weightValue = weightV.textField.text{
                userProfile?.height = Double(heightValue) ?? 0.0
                userProfile?.weight = Double(weightValue) ?? 0.0
            }
            let genderString: String = gender.titleForSegment(at: gender.selectedSegmentIndex) ?? ""
            if let selectedGender = Gender(rawValue: genderString) {
                userProfile?.gender = selectedGender
            }
            if let userProfile = userProfile{
                informationUpdateDelegate?.didUpdateUser(userProfile)
                navigationController?.popViewController(animated: true)
            }
        }
        //        listProfileVC.tab
    }
    
    
    func validateInput(){
        let firstName = firstNameV.textField.text ?? ""
        let lastName = lastNameV.textField.text ?? ""
        let height = heightV.textField.text ?? ""
        let weight = weightV.textField.text ?? ""
        let genderIndex = gender.selectedSegmentIndex
        let genderTitle = gender.titleForSegment(at: genderIndex) ?? ""
        if(!firstName.isEmpty && !lastName.isEmpty && !height.isEmpty &&
           !weight.isEmpty && !genderTitle.isEmpty){
            button.backgroundColor = .primary
        }else{
            button.backgroundColor = .neutral3
        }
    }
    func validateInputUpdate(){
        let firstName = firstNameV.textField.text ?? ""
        let lastName = lastNameV.textField.text ?? ""
        let height = heightV.textField.text ?? ""
        let weight = weightV.textField.text ?? ""
        let genderIndex = gender.selectedSegmentIndex
        let genderTitle = gender.titleForSegment(at: genderIndex) ?? ""
        guard let genderUser = userProfile?.gender.rawValue else{
            return
        }
//        guard let gender = Gender(rawValue: Int(genderTitle) ?? 0) else { return }
//        print("\(userProfile?.gender.rawValue ?? "male") đây là giá trị \n \(genderTitle) là giá trị")
        print("\(genderUser) \(genderTitle)")
        if(firstName != userProfile?.firstName || lastName != userProfile?.lastName
           || height != String(userProfile?.height ?? 0)
           ||  weight != String(userProfile?.weight ?? 0)
           || genderTitle != genderUser
        ){
            button.backgroundColor = .primary
        }else{
            button.backgroundColor = .neutral3
        }
    }
    
    @objc func textFieldChanged(_ sender: Any){
        validateInput()
    }
    @objc func textFieldUpdate(_ sender: Any){
        validateInputUpdate()
    }
    
}
