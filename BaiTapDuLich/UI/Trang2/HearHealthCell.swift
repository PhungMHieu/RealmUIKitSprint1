//
//  HearHealthCell.swift
//  BaiTapDuLich
//
//  Created by Admin on 4/7/25.
//

import UIKit

class HearHealthCell: UICollectionViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var checkBox: CheckBoxView!
    override func awakeFromNib() {
        super.awakeFromNib()
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
    
}
