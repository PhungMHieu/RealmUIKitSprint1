//
//  RateIndexV.swift
//  BaiTapDuLich
//
//  Created by Admin on 5/7/25.
//

import UIKit

class RateIndexV: UIView {
    
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
//        layer.cornerRadius = 16
    }
//    layoutSub
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
        nibView.layer.cornerRadius = 16
        nibView.clipsToBounds = true
    }
    
//    viewDidLayoutSubviews()
    
    func config(color: UIColor){
        pulseV.config(color: color)
        hrv.config(color:  color)
        status.config(color: color)
    }
    func setIndex(status: String, pulse: String, hrv: String){
        self.status.setIndex(index: status)
        self.hrv.setIndex(index: hrv)
        self.pulseV.setIndex(index: pulse)
    }
}
