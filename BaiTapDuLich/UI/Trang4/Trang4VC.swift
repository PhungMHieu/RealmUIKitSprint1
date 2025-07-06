//
//  Trang4VC.swift
//  BaiTapDuLich
//
//  Created by Admin on 5/7/25.
//

import UIKit

class Trang4VC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = trang4V.collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! HearHealthCell
        cell.image.image = UIImage(named: data[indexPath.row].image)
        cell.title.text = data[indexPath.row].healIssue
        return cell
    }
    
    var data: [HearlIssue] = [
        HearlIssue(healIssue: "Educational Plan", image: "plan"),
        HearlIssue(healIssue: "Exercise Plan", image: "exercise-routine"),
        HearlIssue(healIssue: "Health Tests", image: "stress-test")]
    @IBOutlet weak var trang4V: Trang234V!
    override func viewDidLoad() {
        super.viewDidLoad()
        trang4V.nextAction = {[weak self] in
            let healthGuru = HealthGuruVC()
            self?.navigationController?.pushViewController(healthGuru, animated: true)
        }
        trang4V.title.text = "What type of plan would you like to follow?"
        
        let nib = UINib(nibName: "HearHealthCell", bundle: nil)
        trang4V.collectionView.register(nib, forCellWithReuseIdentifier: "Cell")
        trang4V.collectionView.delegate = self
        trang4V.collectionView.dataSource = self
        // Do any additional setup after loading the view.
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
