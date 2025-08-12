//
//  HealthGuruVC.swift
//  BaiTapDuLich
//
//  Created by Admin on 5/7/25.
//

import UIKit
import Combine

class HealthGuruVC: UIViewController{
    @IBOutlet weak var trackDailyV: UIView!
    @IBOutlet weak var rateIndexV: RateIndexV!
    @IBOutlet weak var heartView: UIView!
    @IBOutlet weak var emptyView: UIStackView!
    @IBOutlet weak var trackDailyText: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var clickHeartText: UILabel!
    
    var data:[Index] = []
    private var cancellables: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        updateBackground()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        heartView.isUserInteractionEnabled = true
        heartView.addGestureRecognizer(tapGestureRecognizer)
        trackDailyV.layer.cornerRadius = 16
        trackDailyV.clipsToBounds = true
        rateIndexV.layer.cornerRadius = 16
        rateIndexV.clipsToBounds = true
        trackDailyText.setLetterSpacing(0.2)
        clickHeartText.setLetterSpacing(0.4)
        let titleLabel = UILabel()
        titleLabel.text = "Health Guru"
        titleLabel.textColor = .neutral1
        titleLabel.font = .systemFont(ofSize: 32, weight: .semibold)
        titleLabel.sizeToFit()
        let leftItem = UIBarButtonItem(customView: titleLabel)
        self.navigationItem.leftBarButtonItem = leftItem
        
        
        
        let nib = UINib(nibName: "HealthGuruCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
//        setUpUserObservationDe()
        setUpObservationDetail()
//        clickHeartText.setLetterSpacing(0.2)
//        trackDailyText.setLetterSpacing(0.2)
    }

    func setUpObservationDetail() {
        RealmManager.shared.observeđDetails(Index.self)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] changes in
                guard let tableView = self?.tableView else { return }
                switch changes {
                case .initial(let collection):
                    self?.data =  Array(collection)
                    tableView.reloadData()
                case .update(let collection, deletions: let deletions, insertions: let insertions, modifications: let modifications):
                    self?.data =  Array(collection)
                    tableView.performBatchUpdates {
                        tableView.insertRows(at: insertions.map { IndexPath(row: $0, section: 0) }, with: .automatic)
                        tableView.deleteRows(at: deletions.map { IndexPath(row: $0, section: 0) }, with: .automatic)
                        tableView.reloadRows(at: modifications.map { IndexPath(row: $0, section: 0) }, with: .automatic)
                    }
                case .error(_):
                    print("error")
                }
            }
            .store(in: &cancellables)
    }
    func updateBackground(){
        if(data.isEmpty){
            tableView.isHidden = false
            emptyView.isHidden = true
//            tableView.isHidden = true
//            emptyView.isHidden = false
        }else{
            tableView.isHidden = false
            emptyView.isHidden = true
        }
    }
    @objc func handleTap() {
        let vc = InformationHeartVC()
//        vc.addIndex = {[weak self] index in
//            self?.data.append(index)
//            self?.updateBackground()
//            self?.tableView.reloadData()
//        }
        let nav = UINavigationController(rootViewController: vc)
        present(nav, animated: true)
    }
}
extension HealthGuruVC:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HealthGuruCell
        let hrvText = String(data[indexPath.row].hrv)
        let pulseText = String(data[indexPath.row].pulse)
        let statusText = data[indexPath.row].status
        cell.setIndex(status: statusText, pulse: pulseText, hrv: hrvText)
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
}

extension HealthGuruVC  {
    func setUpUserObservation() {
        RealmManager.shared.observe(Index.self)
            .print()
            .receive(on: DispatchQueue.main)
            .sink { value in
                print(value)
            } receiveValue: { [weak self] indexs in
//                self?.data = indexs.sorted(by: { x0, x1 in
//                    return x0.pulse < x1.pulse
//                })
                self?.data = indexs
                self?.tableView.reloadData()
            }
            .store(in: &cancellables)

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

