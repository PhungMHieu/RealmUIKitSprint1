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
//    var items: [String] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let nib = UINib(nibName: "HearHealthCell1", bundle: nil) // dang ky voi cell con
        hearHealhCollection.register(nib, forCellWithReuseIdentifier: "ChildCell1")
        hearHealhCollection.delegate = self
        hearHealhCollection.dataSource = self
//        if let flowLayout = hearHealhCollection.collectionViewLayout as? UICollectionViewFlowLayout{
//            flowLayout.minimumLineSpacing = 16
//            flowLayout.minimumInteritemSpacing = 16
//            flowLayout.itemSize.height = 195
//            flowLayout.itemSize.width = (hearHealhCollection.bounds.size.width-16)/2
////            flowLayout.itemSize.width = (hearHealhCollection.bounds.size.width-48)/2
////            flowLayout.itemSize.width = 164
////            flowLayout.itemSize = hearHealhCell.bounds.size
//        }
        hearHealhCollection.allowsMultipleSelection = true
    }
    override func layoutSubviews() {
        if let flowLayout = hearHealhCollection.collectionViewLayout as? UICollectionViewFlowLayout{
            flowLayout.minimumLineSpacing = 16
            flowLayout.minimumInteritemSpacing = 16
            flowLayout.itemSize.height = 195
            flowLayout.itemSize.width = (hearHealhCollection.bounds.size.width-16)/2
//            flowLayout.itemSize.width = (hearHealhCollection.bounds.size.width-48)/2
//            flowLayout.itemSize.width = 164
//            flowLayout.itemSize = hearHealhCell.bounds.size
        }
    }
    //    func configure(items: [String]){
//        self.items = items
//        hearHealhCollection.reloadData()
//    }
}
extension ParentHearHealthCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChildCell1", for: indexPath) as! HearHealthCell1
//        print("So luong data la :\(data)")
//        print("Chi so là \(indexPath.row)")
        var itemIndex = indexPath.row
//        print("Chi so là \(indexPath.row)")
        cell.image.image = UIImage(named: data[itemIndex].image)
        cell.title.text = data[itemIndex].healIssue
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        healthCol
//        hearHealhCollection.
//        if let cell = collectionView.cellForItem(at: indexPath){
////            hearHealhCollectionß
//        }
        if let cell = collectionView.cellForItem(at: indexPath) as? HearHealthCell1{
            cell.checkBox.image = UIImage(named: "monotoneCoffeeImage")
            cell.layer.borderColor = UIColor.primary.cgColor
            cell.layer.borderWidth = 1.5
            isChecked[indexPath.item] = true
            changButtoncl?(isChecked)
        }
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? HearHealthCell1{
            cell.checkBox.image = UIImage(named: "monotoneAppleImage")
            cell.layer.borderColor = nil
            cell.layer.borderWidth = 0
            isChecked[indexPath.item] = false
            changButtoncl?(isChecked)
        }
    }
}
