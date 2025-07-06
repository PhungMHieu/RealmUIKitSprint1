//
//  RateIndexV.swift
//  BaiTapDuLich
//
//  Created by Admin on 5/7/25.
//

import UIKit

class RateIndexV: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBOutlet weak var status: IndexV!
    @IBOutlet weak var hrv: IndexV!
    @IBOutlet weak var pulseV: IndexV!
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib()
    }
    required init?(coder: NSCoder){
        super.init(coder: coder)
        loadFromNib()
    }
    override func layoutSubviews() {
        
    }
    private func loadFromNib(){
        let nib = UINib(nibName: "RateIndexV", bundle: nil)
        let nibView = nib.instantiate(withOwner: self).first as! UIView
        addSubview(nibView)
        nibView.translatesAutoresizingMaskIntoConstraints = false
        nibView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        nibView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        nibView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        nibView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        pulseV.config(customIndex: CustomIndex(title: "Pulse", index: "--", unit: "bpm"))
        hrv.config(customIndex: CustomIndex(title: "HRV", index: "--", unit: "bpm"))
        status.config(customIndex: CustomIndex(title: "Status", index: "--", unit: ""))
    }
}
