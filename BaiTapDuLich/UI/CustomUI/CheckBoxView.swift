//
//  CheckBoxView.swift
//  BaiTapDuLich
//
//  Created by Admin on 4/7/25.
//

import Foundation
import UIKit

class CheckBoxView: UIView {
    @IBOutlet weak var button: UIButton!
    var isChecked: Bool = false{
        didSet{
            button.isSelected = isChecked
            button.tintColor = isChecked ? .primary : .neutral4
            button.backgroundColor = isChecked ? .clear : .neutral4
        }
    }
    var onToggle:((Bool)->Void)?
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
        let nib = UINib(nibName: "CheckBoxView", bundle: nil)
        let nibView = nib.instantiate(withOwner: self).first as! UIView
        addSubview(nibView)
        nibView.translatesAutoresizingMaskIntoConstraints = false
        nibView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        nibView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        nibView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        nibView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        button.setImage(UIImage(systemName: "square"), for: .normal)
        button.backgroundColor = .neutral4
        button.tintColor = .neutral4
        button.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
        button.addTarget(self, action: #selector(onTapButton), for: .touchUpInside)
    }
    @objc private func onTapButton(){
        isChecked.toggle()
        onToggle?(isChecked)
    }
}
