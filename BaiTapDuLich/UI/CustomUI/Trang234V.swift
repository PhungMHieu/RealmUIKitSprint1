//
//  Trang234V.swift
//  BaiTapDuLich
//
//  Created by Admin on 5/7/25.
//

import UIKit

class Trang234V: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
     
     */
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextBtn: RoundButton!
    
    var nextAction: (()->Void)?
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
    @IBAction func next(_ sender: Any) {
        nextAction?()
    }
    private func loadFromNib(){
        let nib = UINib(nibName: "Trang234V", bundle: nil)
        let nibView = nib.instantiate(withOwner: self).first as! UIView
        addSubview(nibView)
        nibView.translatesAutoresizingMaskIntoConstraints = false
        nibView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        nibView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        nibView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        nibView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
//        let image = AssetCatalog.Image.increaseEnergyLevels
    }
}
