//
//  Trang2VC.swift
//  BaiTapDuLich
//
//  Created by Admin on 4/7/25.
//

import UIKit

class Trang2VC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var button: RoundButton!
    @IBOutlet weak var collectionView: UICollectionView!
    var hasBorder = false
    
    var data: [HearlIssue] = [
        HearlIssue(healIssue: "Heart rate", image: "pulse"),
        HearlIssue(healIssue: "High Blood Pressure", image: "hybertension"),
        HearlIssue(healIssue: "Stress & Anxiety", image: "stress"),
        HearlIssue(healIssue: "Low Energy Levels", image: "energy-consumption")]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! HearHealthCell
        cell.image.image = UIImage(named: data[indexPath.row].image)
        cell.title.text = data[indexPath.row].healIssue
        cell.changeButtonColor = {[weak self]  in
            self?.updateButtonColor()
        }
        return cell
    }
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if let cell = collectionView.cellForItem(at: indexPath){
////            cell.layer.borderWidth = 1.5
////            cell.layer.borderColor = UIC
////            cell.layer.backgroundColor = UIColor.good.cgColor
//        }
////        updateButtonColor()
//    }
//    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
////        updateButtonColor()
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        button.backgroundColor = .neutral3
        let nib = UINib(nibName: "HearHealthCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "Cell")
//        collectionView.addTa
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    @IBAction func `continue`(_ sender: Any) {
        let trang3 = Trang3VC()
        if(hasBorder){
            navigationController?.pushViewController(trang3, animated: true)
        }
    }
    
    func updateButtonColor(){
        for cell in collectionView.visibleCells{
//            print("Khong ep kieu duoc")
            guard let myCell = cell as? HearHealthCell else{
                print("Khong ep kieu duoc")
                continue
            }
            if myCell.checkBox.button.isSelected{
                hasBorder = true
            }
            //            hasBorder = true
//            print(myCell.title.text)
//            print(cell)
//            print(cell.title.text)
//            print("\(myCell.layer.borderColor) \(UIColor.primary.cgColor)")
//            if myCell.layer.borderColor == UIColor.primary.cgColor{
//                hasBorder = true
//                break
//            }
        }
        if hasBorder {
            button.backgroundColor = .primary
        }else{
            button.backgroundColor = .neutral3
        }
        print(hasBorder)
    }

}
