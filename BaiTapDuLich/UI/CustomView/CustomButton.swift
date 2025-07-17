//
//  CustomButton.swift
//  BaiTapDuLich
//
//  Created by Admin on 3/7/25.
//

import UIKit

class RoundButton: UIButton{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
  
    private func setup(){
        setTitle("Continue", for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        layer.cornerRadius = 16
        layer.masksToBounds = false
    }
}
