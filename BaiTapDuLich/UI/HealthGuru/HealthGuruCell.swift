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
//        layer.cornerRadius = 16
        healthGuruV.layer.cornerRadius = 16
        healthGuruV.layer.masksToBounds = true
        healthGuruV.clipsToBounds = true
        contentView.layer.cornerRadius = 16
        contentView.layer.masksToBounds = true
        contentView.clipsToBounds = true
//        cell.clipsToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func config(color: UIColor){
        healthGuruV.pulseV.index.textColor = color
        healthGuruV.hrv.index.textColor = color
        
        healthGuruV.pulseV.unit.textColor = color
        healthGuruV.hrv.unit.textColor = color
        healthGuruV.status.index.textColor = color
        
//        healthGuruV.pulseV.index.font = UIFont.boldSystemFont(ofSize: healthGuruV.pulseV.index.font.pointSize)
//        healthGuruV.hrv.index.font = UIFont.boldSystemFont(ofSize: healthGuruV.pulseV.index.font.pointSize)
//        healthGuruV.status.index.font = UIFont.boldSystemFont(ofSize: healthGuruV.pulseV.index.font.pointSize)
    }
    
}
