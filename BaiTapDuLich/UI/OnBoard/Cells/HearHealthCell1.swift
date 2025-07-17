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
    @IBOutlet weak var checkBox: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 20
        title.setLineHeight(26)
    }
    func config(title: String, image: String){
        self.title.text = title
        self.image.image = UIImage(named: image)
    }
    func setCheckBox(image: String){
        checkBox.image = UIImage(named: image)
    }
}

