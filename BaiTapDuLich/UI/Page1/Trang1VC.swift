//
//  Trang1VC.swift
//  BaiTapDuLich
//
//  Created by Admin on 3/7/25.
//

import UIKit

class Trang1VC: UIViewController {

    @IBOutlet weak var detailInfo: UILabel!
    override func viewDidLoad() {
//        detailInfo.line
//        detailInfo.numberOfLines = 2
//        detailInfo.textAlignment = .center
//        detailInfo.a
        super.viewDidLoad()
        let attributedString = NSMutableAttributedString(string: detailInfo.text!)
        let paragraphStyle = NSMutableParagraphStyle()
//        paragraphStyle.minimumLineHeight = 24
//        paragraphStyle.maximumLineHeight = 24
        paragraphStyle.alignment = .center
        paragraphStyle.lineSpacing = 8
//        paragraphStyle.colo
        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: detailInfo.text!.count))
        detailInfo.attributedText = attributedString
//        detailInfo.set
        // Do any additional setup after loading the view.
    }
    
    @IBAction func `continue`(_ sender: Any) {
//        let page2 = Page2VC()
        let page2 = OnBoardVC()
        navigationController?.pushViewController(page2, animated: true)
    }
}
//extension UILabel{
//    func addLineHeight(_ lineHeight: CGFloat){
//        guard let text = self.text ?? self.attributedText?.string else {return}
//        let attributed: NSMutableAttributedString
//        if let existing = self.attributedText{
//            attributed = NSMutableAttributedString(attributedString: existing)
//        }else{
//            
//        }
//    }
//}
