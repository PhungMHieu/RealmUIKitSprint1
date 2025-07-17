//
//  HealthGuruCell.swift
//  BaiTapDuLich
//
//  Created by Admin on 7/7/25.
//

import UIKit

class HealthGuruCell: UITableViewCell {

    @IBOutlet weak var healthGuruV: RateIndexV!
    override func awakeFromNib() {
        super.awakeFromNib()
        healthGuruV.layer.cornerRadius = 16
        healthGuruV.layer.masksToBounds = true
        healthGuruV.clipsToBounds = true
        contentView.layer.cornerRadius = 16
        contentView.layer.masksToBounds = true
        contentView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func config(color: UIColor){
        healthGuruV.config(color: color)
    }
    func setIndex(status: String, pulse: String, hrv: String){
        healthGuruV.setIndex(status: status, pulse: pulse, hrv: hrv)
    }
}
