//
//  ActivityProgressTableViewCell.swift
//  CustomLoginPage
//
//  Created by Jaldeep Patel on 2021-06-08.
//

import UIKit

class ActivityProgressTableViewCell: UITableViewCell {

    @IBOutlet var activityTrackingView: UIView!
    @IBOutlet var activityNameLabel: UILabel!
    @IBOutlet var personalNoteTextView: UITextView!
    @IBOutlet var practicedDayLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
