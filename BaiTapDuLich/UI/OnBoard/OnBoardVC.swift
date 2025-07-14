//
//  Trang2VC.swift
//  BaiTapDuLich
//
//  Created by Admin on 4/7/25.
//

import UIKit

class OnBoardVC: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource{
    
    @IBOutlet weak var nextBtn: RoundButton!
    @IBOutlet weak var healthCollectionView: UICollectionView!
    var index: Int = 0
    //    @IBOutlet weak var healthCollectionView: UICollectionView!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = healthCollectionView.dequeueReusableCell(withReuseIdentifier: "ParentHearHealthCell", for: indexPath) as! ParentHearHealthCell
        
        cell.changButtoncl = {[weak self] isChecked in
            var tmp = 0
            for value in isChecked{
                if(value == true){
                    self?.nextBtn.backgroundColor = .primary
                }else{
                    tmp += 1
                }
            }
            if(tmp == 4){
                self?.nextBtn.backgroundColor = .neutral3
            }
        }
//        self.index = indexPath.item
//        if(indexPath.item == 2){
//            cell.hearHealhCell.isHidden = true
//        }
        return cell
    }
    
    override func viewDidLoad() {
//        let nib = UINib(data: <#T##Data#>, bundle: nil)
        let nib = UINib(nibName: "ParentHearHealthCell", bundle: nil)
        healthCollectionView.register(nib, forCellWithReuseIdentifier: "ParentHearHealthCell")
        healthCollectionView.delegate = self
        healthCollectionView.dataSource = self
        healthCollectionView.register(nib, forCellWithReuseIdentifier: "Parent Cell")
        healthCollectionView.isScrollEnabled = false
        if let flowLayout = healthCollectionView.collectionViewLayout as? UICollectionViewFlowLayout{
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 16
//            flowLayout.minimumInteritemSpacing = 16
            flowLayout.itemSize = healthCollectionView.bounds.size
//            flowLayout.itemSize.width = 350
//            flowLayout.itemSize.height = healthCollectionView.bounds.size.height
        }
//        nextBtn.addTarget(self, action: #selector(changeBtnColor), for: .valueChanged)
//        healthCollectionView.isPagingEnabled = true
//        healthCollectionView.showsHorizontalScrollIndicator = false
        
//        healthCollectionView.register(<#T##cellClass: AnyClass?##AnyClass?#>, forCellWithReuseIdentifier: <#T##String#>)
    }
    
    @IBAction func nextAction(_ sender: Any) {
        let currentIndexPath = IndexPath(item: index, section: 0)
        if let cell = healthCollectionView.cellForItem(at: currentIndexPath) as? ParentHearHealthCell{
            for value in cell.isChecked{
                if(value == true){
                    if(index == 2){
                        let healthGuru = HealthGuruVC()
                        navigationController?.pushViewController(healthGuru, animated: true)
                        return
                    }
                    index += 1
                    print("Trang sẽ tới là \(index)")
        //            self.index = index+1
                    let indexPath = IndexPath(item: index, section: 0)
                    healthCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                }
            }
        }
    }
//    @objc func changeBtnColor(value: [Bool]){
//        var checkBtn = true
//        for tmp in value{
//            if tmp == true{
//                nextBtn.backgroundColor = .primary
//                checkBtn = false
//            }
//        }
//        if checkBtn{
//            nextBtn.backgroundColor = .neutral3
//        }
//    }
}
//extension



//@IBOutlet weak var button: RoundButton!
//@IBOutlet weak var collectionView: UICollectionView!
//var hasBorder = false
//
//var data: [HearlIssue] = [
//    HearlIssue(healIssue: "Heart rate", image: "pulse"),
//    HearlIssue(healIssue: "High Blood Pressure", image: "hybertension"),
//    HearlIssue(healIssue: "Stress & Anxiety", image: "stress"),
//    HearlIssue(healIssue: "Low Energy Levels", image: "energy-consumption")]
//
//func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//    return 4
//}
//
//func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! HearHealthCell
//    cell.image.image = UIImage(named: data[indexPath.row].image)
//    cell.title.text = data[indexPath.row].healIssue
//    cell.changeButtonColor = {[weak self]  in
//        self?.updateButtonColor()
//    }
//    return cell
//}
////    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
////        if let cell = collectionView.cellForItem(at: indexPath){
//////            cell.layer.borderWidth = 1.5
//////            cell.layer.borderColor = UIC
//////            cell.layer.backgroundColor = UIColor.good.cgColor
////        }
//////        updateButtonColor()
////    }
////    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//////        updateButtonColor()
////    }
//override func viewDidLoad() {
//    super.viewDidLoad()
//    navigationController?.setNavigationBarHidden(true, animated: false)
//    button.backgroundColor = .neutral3
//    let nib = UINib(nibName: "HearHealthCell", bundle: nil)
//    collectionView.register(nib, forCellWithReuseIdentifier: "Cell")
////        collectionView.addTa
//    // Do any additional setup after loading the view.
//    collectionView.delegate = self
//    collectionView.dataSource = self
////        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
////            layout.itemSize = CGSize(width: 100, height: 100) // đặt kích thước mong muốn
////        }
//}
//
//@IBAction func `continue`(_ sender: Any) {
//    let trang3 = Trang3VC()
//    if(hasBorder){
//        navigationController?.pushViewController(trang3, animated: true)
//    }
//}
//
//func updateButtonColor(){
//    var tmp = 0
//    for cell in collectionView.visibleCells{
////            print("Khong ep kieu duoc")
//        guard let myCell = cell as? HearHealthCell else{
//            print("Khong ep kieu duoc")
//            continue
//        }
//        if myCell.checkBox.button.isSelected{
//            hasBorder = true
//        }else{
//            tmp+=1
//        }
////            else{
////                hasBorder = false
////            }
//        //            hasBorder = true
////            print(myCell.title.text)
////            print(cell)
////            print(cell.title.text)
////            print("\(myCell.layer.borderColor) \(UIColor.primary.cgColor)")
////            if myCell.layer.borderColor == UIColor.primary.cgColor{
////                hasBorder = true
////                break
////            }
//    }
//    if(tmp == 4){
//        hasBorder = false
//        tmp = 0
//    }
//    if hasBorder{
//        button.backgroundColor = .primary
//    }else{
//        button.backgroundColor = .neutral3
//    }
//    print(hasBorder)
//}
