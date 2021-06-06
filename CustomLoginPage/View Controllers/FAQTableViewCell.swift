//
//  FAQTableViewCell.swift
//  CustomLoginPage
//
//  Created by Jaldeep Patel on 2021-06-06.
//

import UIKit

class FAQTableViewCell: UITableViewCell {

    
    @IBOutlet var faqView: UIView!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //styleTableViewCell()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func styleTableViewCell() {
        

        //Style CellView
        faqView.layer.cornerRadius = faqView.frame.height / 10
        faqView.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        faqView.layer.borderWidth = 2
    }

}
