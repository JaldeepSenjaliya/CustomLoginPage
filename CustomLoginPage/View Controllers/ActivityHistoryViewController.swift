//
//  ActivityHistoryViewController.swift
//  CustomLoginPage
//
//  Created by Jaldeep Patel on 2021-06-08.
//

import UIKit

class ActivityHistoryViewController: UIViewController {
    
    @IBOutlet var titleView: UIView!
    @IBOutlet var progressView: UIView!
    @IBOutlet var tableViewHeadingView: UIView!
    @IBOutlet var activityHeaderNameLabel: UILabel!
    @IBOutlet var activityTagLineLabel: UILabel!
    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var daysSinceStartedLabel: UILabel!
    @IBOutlet var thisMonthLabel: UILabel!
    @IBOutlet var streakLabel: UILabel!
    @IBOutlet var circularProgressBar: CircularProgressView!
    
    @IBOutlet var activityProgressTableView: UITableView!

    let personalNote = ["Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ", "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."]
    
    let daysSinceStarted = ["4", "3", "2", "1"]
    let date = ["June 08, 2021", "June 07, 2021", "June 06, 2021", "June 05, 2021"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        circularProgressBar.trackClr = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        circularProgressBar.progressClr = #colorLiteral(red: 0, green: 0.7097216845, blue: 0.6863465309, alpha: 1)
        circularProgressBar.setProgressWithAnimation(duration: 1.0, value: 0.55)

        progressView.layer.cornerRadius = progressView.frame.height / 10
        progressView.layer.borderColor = #colorLiteral(red: 0, green: 0.7097216845, blue: 0.6863465309, alpha: 1)
        progressView.layer.borderWidth = 3
        
        titleView.layer.cornerRadius = titleView.frame.height / 4
        titleView.layer.borderColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        titleView.layer.borderWidth = 3
        
        tableViewHeadingView.layer.cornerRadius = titleView.frame.height / 3.5
        
        activityProgressTableView.delegate = self
        activityProgressTableView.dataSource = self
                
    }

}

extension ActivityHistoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personalNote.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "activityDetailsViewCellIdentifier", for: indexPath) as! ActivityProgressTableViewCell
        cell.activityNameLabel.text = date[indexPath.row]
        cell.personalNoteTextView.text = personalNote[indexPath.row]
        cell.practicedDayLabel.text = daysSinceStarted[indexPath.row]
        
        return cell
    }

}
