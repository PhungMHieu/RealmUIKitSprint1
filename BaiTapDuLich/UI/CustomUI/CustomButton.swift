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
//        fatalError("init(coder:) has not been implemented")
        super.init(coder: coder)
        setup()
    }
    private func setup(){
        setTitle("Continue", for: .normal)
        setTitleColor(.neutral5, for: .normal)
        backgroundColor = .primary
        layer.cornerRadius = 16
        layer.shadowColor = UIColor.shadow.cgColor
        layer.shadowOpacity = 0.32
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 12
        layer.masksToBounds = false
    }
}
