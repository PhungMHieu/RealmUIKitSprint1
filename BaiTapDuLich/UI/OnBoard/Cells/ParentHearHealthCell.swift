//
//  ParentHearHealthCell.swift
//  BaiTapDuLich
//
//  Created by Admin on 13/7/25.
//

import UIKit

class ParentHearHealthCell: UICollectionViewCell {
    var data: [HearlIssue] = [
        HearlIssue(healIssue: "Heart rate", image: "pulse"),
        HearlIssue(healIssue: "High Blood Pressure", image: "hybertension"),
        HearlIssue(healIssue: "Stress & Anxiety", image: "stress"),
        HearlIssue(healIssue: "Low Energy Levels", image: "energy-consumption")]

    @IBOutlet weak var hearHealhCell: UICollectionView!
    var items: [String] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let nib = UINib(nibName: "HearHealthCell", bundle: nil) // dang ky voi cell con
        hearHealhCell.register(nib, forCellWithReuseIdentifier: "ChildCell")
        hearHealhCell.delegate = self
        hearHealhCell.dataSource = self
    }
    func configure(items: [String]){
        self.items = items
        hearHealhCell.reloadData()
    }
}
extension ParentHearHealthCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChildCell", for: indexPath) as! HearHealthCell
        cell.image.image = UIImage(named: data[indexPath.row].image)
        cell.title.text = data[indexPath.row].healIssue
        return cell
    }
    
    
}
