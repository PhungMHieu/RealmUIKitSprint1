//
//  Trang3VC.swift
//  BaiTapDuLich
//
//  Created by Admin on 5/7/25.
//

import UIKit

class Trang3VC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
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
    
//    var data: [String] = ["dumbbell","pressure","harmony","no-energy"]
    var data: [HearlIssue] = [
        HearlIssue(healIssue: "Improve Heart Health", image: "dumbbell"),
        HearlIssue(healIssue: "Improve blood pressure health", image: "pressure"),
        HearlIssue(healIssue: "Reduce Stress", image: "harmony"),
        HearlIssue(healIssue: "Increase Energy Levels", image: "no-energy")]

    @IBOutlet weak var trang234V: Trang234V!
    var hasBorder = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trang234V.nextBtn.backgroundColor = .neutral3
        trang234V.title.text = "What would you like to achieve?"
        let nib = UINib(nibName: "HearHealthCell", bundle: nil)
        trang234V.collectionView.register(nib, forCellWithReuseIdentifier: "Cell")
        trang234V.collectionView.delegate = self
        trang234V.collectionView.dataSource = self
        trang234V.nextAction = {[weak self] in
            let vc = Trang4VC()
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        // Do any additional setup after loading the view.
    }
    func updateButtonColor(){
        
        for cell in trang234V.collectionView.visibleCells{
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
            trang234V.nextBtn.backgroundColor = .primary
        }else{
            trang234V.nextBtn.backgroundColor = .neutral3
        }
        print(hasBorder)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
