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
        cell.changeButtonColor = {[weak self]  in
            self?.updateButtonColor()
        }
        return cell
    }
    
    var data: [HearlIssue] = [
        HearlIssue(healIssue: "Educational Plan", image: "plan"),
        HearlIssue(healIssue: "Exercise Plan", image: "exercise-routine"),
        HearlIssue(healIssue: "Health Tests", image: "stress-test")]
    @IBOutlet weak var trang4V: Trang234V!
    
    var hasBorder = false
    override func viewDidLoad() {
        super.viewDidLoad()
        trang4V.nextBtn.backgroundColor = .neutral3
        trang4V.nextAction = {[weak self] in
//            let healthGuru = HealthGuruVC()
//            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
//               let sceneDelegate = windowScene.delegate as? SceneDelegate,
//               let window = sceneDelegate.window {
//                window.rootViewController = healthGuru
//                window.makeKeyAndVisible()
//            }
            UserDefaults.standard.set(true, forKey: "didEnterMainApp")
            
//            ßself?.navigationController?.pushViewController(healthGuru, animated: true)
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                  let sceneDelegate = windowScene.delegate as? SceneDelegate,
                  let window = sceneDelegate.window else { return }
//            let window = UIWindow(windowScene: windowScene)
    //        let vc = ProfileVC()
    //        let vc = InformationVC()
//            let vc = Trang1VC()
//            let navi = UINavigationController(rootViewController: vc)
    //        let vc = Trang2VC()
            let settingsVC = SettingsVC()
            let settingsNavi = UINavigationController(rootViewController: settingsVC)
            settingsVC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gearshape"), selectedImage: UIImage(systemName: "gearshape.fill"))
            let healthGuruVC = HealthGuruVC()
            healthGuruVC.tabBarItem = UITabBarItem(title: "Report", image: UIImage(systemName: "chart.bar.horizontal.page"), selectedImage: UIImage(systemName: "chart.bar.horizontal.page.fill"))
            let healthGuruNavi = UINavigationController(rootViewController: healthGuruVC)
        
            
    //        let vc = TestCollectionVVc()
    //        let vc = ListUserVC()
            
    //        window.rootViewController = navi
            let tabBarController = UITabBarController()
            tabBarController.viewControllers = [healthGuruNavi, settingsNavi]
            tabBarController.tabBar.tintColor = .primary
            window.rootViewController = tabBarController
//            window.rootViewController = navi
//            self.window = window
            window.makeKeyAndVisible()
        }
        trang4V.title.text = "What type of plan would you like to follow?"
        
        let nib = UINib(nibName: "HearHealthCell", bundle: nil)
        trang4V.collectionView.register(nib, forCellWithReuseIdentifier: "Cell")
        trang4V.collectionView.delegate = self
        trang4V.collectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    func updateButtonColor(){
        
        for cell in trang4V.collectionView.visibleCells{
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
            trang4V.nextBtn.backgroundColor = .primary
        }else{
            trang4V.nextBtn.backgroundColor = .neutral3
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
