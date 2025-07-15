//
//  HealthGuruVC.swift
//  BaiTapDuLich
//
//  Created by Admin on 5/7/25.
//

import UIKit

class HealthGuruVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var data:[Index] = [
//        Index(pulse: 80, hrv: 90),
//        Index(pulse: 80, hrv: 90),
//        Index(pulse: 80, hrv: 90)
    ]
    @IBOutlet weak var trackDailyV: UIView!
    @IBOutlet weak var rateIndexV: RateIndexV!
    @IBOutlet weak var heartView: UIView!
    @IBOutlet weak var emptyView: UIStackView!
    @IBOutlet weak var trackDailyText: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var clickHeartText: UILabel!
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateBackground()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        heartView.isUserInteractionEnabled = true
        heartView.addGestureRecognizer(tapGestureRecognizer)
        trackDailyV.layer.cornerRadius = 16
        rateIndexV.layer.cornerRadius = 16
        trackDailyText.setLetterSpacing(0.2)
        clickHeartText.setLetterSpacing(0.4)
//        emptyView
//        emptyView
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
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
extension UILabel{
    func setLetterSpacing(_ spacing: CGFloat) {
        guard let text = text else { return }
        let attributedString: NSMutableAttributedString
        if let existing = self.attributedText{
            attributedString = NSMutableAttributedString(attributedString: existing)
        }else{
            attributedString = NSMutableAttributedString(string: text)
        }
        attributedString.addAttribute(.kern, value: spacing, range: NSRange(location: 0, length: attributedString.length-1))
        self.attributedText = attributedString
    }
}
