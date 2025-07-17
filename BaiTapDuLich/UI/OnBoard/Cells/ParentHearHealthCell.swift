//
//  ParentHearHealthCell.swift
//  BaiTapDuLich
//
//  Created by Admin on 13/7/25.
//

import UIKit

class ParentHearHealthCell: UICollectionViewCell {
    var categoryName: String?
    lazy var data: [HearlIssue] = {
        Page(rawValue: categoryName ?? "page1")?.items ?? []
    }()
    var isChecked: [Bool] = [false, false, false, false]
    var changButtoncl: (([Bool])->Void)?
    @IBOutlet weak var hearHealhCollection: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let nib = UINib(nibName: "HearHealthCell1", bundle: nil) // dang ky voi cell con
        hearHealhCollection.register(nib, forCellWithReuseIdentifier: "ChildCell1")
        hearHealhCollection.delegate = self
        hearHealhCollection.dataSource = self
        hearHealhCollection.allowsMultipleSelection = true
    }
    override func layoutSubviews() {
        if let flowLayout = hearHealhCollection.collectionViewLayout as? UICollectionViewFlowLayout{
            flowLayout.minimumLineSpacing = 16
            flowLayout.minimumInteritemSpacing = 16
            flowLayout.itemSize.height = 195
            flowLayout.itemSize.width = (hearHealhCollection.bounds.size.width-16)/2
        }
    }
    
    func setCategoryName(_ name: String){
        categoryName = name
    }
}
extension ParentHearHealthCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChildCell1", for: indexPath) as! HearHealthCell1
        let itemIndex = indexPath.row
        cell.config(title: data[itemIndex].healIssue, image: data[itemIndex].image)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? HearHealthCell1{
            cell.setCheckBox(image: "monotoneCoffeeImage")
            cell.layer.borderColor = UIColor.primary.cgColor
            cell.layer.borderWidth = 1.5
            isChecked[indexPath.item] = true
            changButtoncl?(isChecked)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? HearHealthCell1{
            cell.setCheckBox(image: "monotoneAppleImage")
            cell.layer.borderColor = nil
            cell.layer.borderWidth = 0
            isChecked[indexPath.item] = false
            changButtoncl?(isChecked)
        }
    }
}
