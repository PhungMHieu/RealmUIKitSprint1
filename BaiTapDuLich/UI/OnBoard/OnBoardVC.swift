//
//  OnBoardVC.swift
//  BaiTapDuLich
//
//  Created by Admin on 4/7/25.
//

import UIKit

class OnBoardVC: UIViewController{
    var index: Int = 0{
        didSet {
            titleOfPage.text = pageTitle
        }
    }
    var categoryName: [String] = ["page1","page2","page3"]
    var pageTitle: String{
        Page(rawValue: categoryName[index])?.titles ?? ""
    }
    
    @IBOutlet weak var nextBtn: RoundButton!
    @IBOutlet weak var healthCollectionView: UICollectionView!
    @IBOutlet weak var titleOfPage: UILabel!
    
    override func viewDidLoad() {
        let nib = UINib(nibName: "ParentHearHealthCell", bundle: nil)
        healthCollectionView.register(nib, forCellWithReuseIdentifier: "ParentHearHealthCell")
        healthCollectionView.delegate = self
        healthCollectionView.dataSource = self
        healthCollectionView.register(nib, forCellWithReuseIdentifier: "Parent Cell")
        healthCollectionView.isScrollEnabled = false
        healthCollectionView.isPagingEnabled = true
        titleOfPage.text = pageTitle
        titleOfPage.setLineHeight(38)
    }
    override func viewDidLayoutSubviews() {
        if let flowLayout = healthCollectionView.collectionViewLayout as? UICollectionViewFlowLayout{
            flowLayout.minimumLineSpacing = 0
            flowLayout.itemSize.height = healthCollectionView.bounds.size.height
            flowLayout.itemSize.width = healthCollectionView.bounds.size.width
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    func setUpRootVC(){
        UserDefaults.standard.set(true, forKey: "didEnterMainApp")
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let sceneDelegate = windowScene.delegate as? SceneDelegate,
              let window = sceneDelegate.window else { return }
        let settingsVC = SettingsVC()
        let settingsNavi = UINavigationController(rootViewController: settingsVC)
        settingsVC.tabBarItem = UITabBarItem(title: "Settings", image: .setting, selectedImage: .settingRed)
        let healthGuruVC = HealthGuruVC()
        healthGuruVC.tabBarItem = UITabBarItem(title: "Report", image: .chart, selectedImage: .chartRed)
        let healthGuruNavi = UINavigationController(rootViewController: healthGuruVC)
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [healthGuruNavi, settingsNavi]
        tabBarController.tabBar.tintColor = .primary
        tabBarController.tabBar.barTintColor = .neutral5
//        let apperance = tabBarController.tabBar.standardAppearance
//        apperance.configureWithOpaqueBackground()
//        apperance.backgroundColor = .neutral5
//        tabBarController.tabBar.standardAppearance = apperance
//        tabBarController.tabBar.scrollEdgeAppearance = apperance
        tabBarController.tabBar.layer.cornerRadius = 20
        tabBarController.tabBar.layer.masksToBounds = true
        tabBarController.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
    @IBAction func nextAction(_ sender: Any) {
        let currentIndexPath = IndexPath(item: index, section: 0)
        if let cell = healthCollectionView.cellForItem(at: currentIndexPath) as? ParentHearHealthCell{
            for value in cell.isChecked{
                if(value == true){
                    if(index == 2){
                        setUpRootVC()
                        let healthGuru = HealthGuruVC()
                        navigationController?.pushViewController(healthGuru, animated: true)
                        return
                    }
                    index += 1
                    let indexPath = IndexPath(item: index, section: 0)
                    nextBtn.backgroundColor = .neutral3
                    healthCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
                    break
                }
            }
        }
    }
}
extension OnBoardVC:UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryName.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = healthCollectionView.dequeueReusableCell(withReuseIdentifier: "ParentHearHealthCell", for: indexPath) as! ParentHearHealthCell
        cell.categoryName = categoryName[indexPath.row]
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
        return cell
    }
}
