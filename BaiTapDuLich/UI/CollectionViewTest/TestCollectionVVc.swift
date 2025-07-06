//
//  TestCollectionVVc.swift
//  BaiTapDuLich
//
//  Created by Admin on 4/7/25.
//

import UIKit

class TestCollectionVVc: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! HomeCell
        cell.nameLabel.text = "Hello"
        return cell
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    var users: [User] = User.getDummyDatas()
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "HomeCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "Cell")
        print(collectionView.bounds)
        collectionView.delegate = self
//        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        collectionView.dataSource = self
        title = "Home"
        print(users.count)
        // Do any additional setup after loading the view.
    }
}
