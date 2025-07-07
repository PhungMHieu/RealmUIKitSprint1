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
        let status = data[indexPath.row].status
        cell.selectionStyle = .none
        if(status == "Low"){
            cell.config(color: .low)
        }else if(status == "Good"){
            cell.config(color: .accentNormal)
        }else{
            cell.config(color: .warning)
        }
        return cell
    }
    

    @IBOutlet weak var trackDailyV: UIView!
    @IBOutlet weak var rateIndexV: RateIndexV!
    @IBOutlet weak var heartView: UIView!
    @IBOutlet weak var emptyView: UIStackView!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateBackground()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        heartView.isUserInteractionEnabled = true
        heartView.addGestureRecognizer(tapGestureRecognizer)
        trackDailyV.layer.cornerRadius = 16
        rateIndexV.layer.cornerRadius = 16
//        emptyVie
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
        tableView.separatorStyle = .none
//        tableView.
        
//        title.alignment(to: .leading)
//        title.al
        // Do any additional setup after loading the view.
    }
    var data:[Index] = [
//        Index(pulse: 80, hrv: 90),
//        Index(pulse: 80, hrv: 90),
//        Index(pulse: 80, hrv: 90)
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
        let vc = InformationHeartVC()
        vc.addIndex = {[weak self] index in
            self?.data.append(index)
            self?.updateBackground()
            self?.tableView.reloadData()
        }
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
