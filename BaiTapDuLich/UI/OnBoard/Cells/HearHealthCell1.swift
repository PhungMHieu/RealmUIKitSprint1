//
//  HearHealthCell.swift
//  BaiTapDuLich
//
//  Created by Admin on 4/7/25.
//

import UIKit

class HearHealthCell1: UICollectionViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var image: UIImageView!
//    @IBOutlet weak var checkBoxIMG: UIImageView!
    @IBOutlet weak var checkBox: UIImageView!
//    @IBOutlet weak var checkBoxImage: UIImageView!
    //    @IBOutlet weak var checkBox: CheckBoxView!
    
//    var changeButtonColor: (() ->Void)?
//    @IBOutlet weak var imageICon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.addTarget(self, action: <#T##Selector#>)
//        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = 20
//        checkBox.image = UIImage(named: "monotoneCoffeeImage")
//        checkBox.layer.cornerRadius = 5
//        layer.masksToBounds = true
//        contentView
//        view?.layer.cornerRadius = 20
//        checkBox.button.addTarget(self, action:#selector(onTapBtn), for: .touchUpInside)
//        checkBox.onToggle = {[weak self] (isChecked) in
//            self?.checkBox.onToggle = {(isChecked) in
//                if(isChecked){
//                    self?.checkBox.button.backgroundColor = .good
//                }else{
//                    self?.checkBox.button.backgroundColor = .red
//                }
//                
//            }
//        }
        // Initialization code
    }
//    @objc func onTapBtn(){
//        if(checkBox.button.isSelected){
//            layer.borderColor = UIColor.primary.cgColor
//            layer.borderWidth = 1.5
//        }else{
//            layer.borderColor = nil
//            layer.borderWidth = 0
//        }
//        changeButtonColor?()
//    }
}

