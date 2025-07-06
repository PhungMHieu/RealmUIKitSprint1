//
//  Trang2VC.swift
//  BaiTapDuLich
//
//  Created by Admin on 4/7/25.
//

import UIKit

class Trang2VC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! HearHealthCell
        cell.image.image = UIImage(named: data[indexPath.row].image)
        cell.title.text = data[indexPath.row].healIssue
        return cell
    }
    

    @IBOutlet weak var collectionView: UICollectionView!
    var data: [HearlIssue] = [
        HearlIssue(healIssue: "Heart rate", image: "pulse"),
        HearlIssue(healIssue: "High Blood Pressure", image: "hybertension"),
        HearlIssue(healIssue: "Stress & Anxiety", image: "stress"),
        HearlIssue(healIssue: "Low Energy Levels", image: "energy-consumption")]
    
    @IBAction func `continue`(_ sender: Any) {
        let trang3 = Trang3VC()
        navigationController?.pushViewController(trang3, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "HearHealthCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "Cell")
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
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
