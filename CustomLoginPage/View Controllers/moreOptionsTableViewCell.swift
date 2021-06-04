//
//  moreOptionsTableViewCell.swift
//  CustomLoginPage
//
//  Created by Jaldeep Patel on 2021-06-03.
//

import UIKit

class moreOptionsTableViewCell: UITableViewCell {

    //More Screen TableViewCell outlets
    @IBOutlet var moreOptionsCellView: UIView!
    @IBOutlet var moreOptionsImageView: UIImageView!
    @IBOutlet var nextImageView: UIImageView!
    @IBOutlet var optionsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        styleTableViewCell()
}

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func styleTableViewCell() {
        
        //Style OptionsImageView color
        moreOptionsImageView.tintColor = UIColor.init(red: 62/255, green: 178/255, blue: 174/255, alpha: 1)
        
        //Style nextImageView and color
        nextImageView.image = UIImage(named: "next")
        nextImageView.tintColor = .gray
        
        //Style CellView
        moreOptionsCellView.layer.cornerRadius = moreOptionsCellView.frame.height / 6
        moreOptionsCellView.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        moreOptionsCellView.layer.borderWidth = 2
    }

}
