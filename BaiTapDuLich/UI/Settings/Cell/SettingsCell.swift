//
//  SettingsCell.swift
//  BaiTapDuLich
//
//  Created by Admin on 6/7/25.
//

import UIKit

class SettingsCell: UITableViewCell {

    @IBOutlet weak var seperatorLineV: UIView!
    @IBOutlet weak var imageOfCell: UIImageView!
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func config(setting: Setting){
        layer.cornerRadius = 12
        selectionStyle = .none
        title.text = setting.title
        imageOfCell.image = UIImage(named: setting.image)
    }
    func setSepearatorLine(isHidden: Bool){
        seperatorLineV.isHidden = isHidden
    }
}
