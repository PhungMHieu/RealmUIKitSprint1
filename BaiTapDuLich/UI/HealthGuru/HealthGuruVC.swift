//
//  HealthGuruVC.swift
//  BaiTapDuLich
//
//  Created by Admin on 5/7/25.
//

import UIKit

class HealthGuruVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HealthGuruCell
        cell.healthGuruV.hrv.index.text = String(data[indexPath.row].hrv)
        cell.healthGuruV.pulseV.index.text = String(data[indexPath.row].pulse)
        cell.healthGuruV.status.index.text = data[indexPath.row].status
//        cell.healthGuruV.hrv.value.text = data[indexPath.row].value
        return cell
//        cell.healthGuruV.pulseV.title.text = ""
    }
    

    @IBOutlet weak var heartView: UIView!
    @IBOutlet weak var emptyView: UIStackView!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateBackground()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        heartView.isUserInteractionEnabled = true
        heartView.addGestureRecognizer(tapGestureRecognizer)
        
//        title = "Health Guru"
        let titleLabel = UILabel()
        titleLabel.text = "Health Guru"
        titleLabel.textColor = .neutral1
        titleLabel.font = .systemFont(ofSize: 32, weight: .bold)
        titleLabel.sizeToFit()
        let leftItem = UIBarButtonItem(customView: titleLabel)
        self.navigationItem.leftBarButtonItem = leftItem
        let nib = UINib(nibName: "HealthGuruCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
//        title.alignment(to: .leading)
//        title.al
        // Do any additional setup after loading the view.
    }
    var data:[Index] = [
        Index(pulse: 80, hrv: 90, status: "Good"),
        Index(pulse: 80, hrv: 90, status: "Low"),
        Index(pulse: 80, hrv: 90, status: "High")
    ]
    func updateBackground(){
        if(data.isEmpty){
            tableView.isHidden = true
            emptyView.isHidden = false
        }else{
            tableView.isHidden = false
            emptyView.isHidden = true
        }
    }
    @objc func handleTap() {
        let vc = InformationVC()
        navigationController?.pushViewController(vc, animated: true)
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
