//
//  Trang1VC.swift
//  BaiTapDuLich
//
//  Created by Admin on 3/7/25.
//

import UIKit

class Page1VC: UIViewController {

    @IBOutlet weak var detailInfo: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        detailInfo.setLineHeight(24)
    }
    @IBAction func `continue`(_ sender: Any) {
        let page2 = OnBoardVC()
        navigationController?.pushViewController(page2, animated: true)
        
    }
}
extension UILabel{
    func setLineHeight(_ lineHeight: CGFloat){
        guard let text = self.text, !text.isEmpty else{
            return
        }
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = lineHeight
        paragraphStyle.maximumLineHeight = lineHeight
        paragraphStyle.alignment = self.textAlignment
        let attributes: [NSAttributedString.Key: Any] = [
            .font: self.font ?? UIFont.systemFont(ofSize: 3),
            .foregroundColor: self.textColor ?? UIColor.cyan,
            .paragraphStyle: paragraphStyle
        ]
        let attributedString = NSAttributedString(string: text, attributes: attributes)
        self.attributedText = attributedString
    }
}
