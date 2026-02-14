//
//  HistoryVC.swift
//  VoiceMint
//
//  Created by test on 29/08/25.
//

import UIKit

class HistoryVC: UIViewController {
    
    @IBOutlet weak var historyTable: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
      

}

extension HistoryVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableCell", for: indexPath) as! HistoryTableCell
        HomeVC.btnDropShadow(views: [cell.mainView, cell.btnPlay, cell.btnRemove, cell.btnShare])
        cell.lblType.layer.cornerRadius = IpadorIphone(value: 16)
        cell.lblType.layer.masksToBounds = true

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        IpadorIphone(value: 230)
    }
    
}

class HistoryTableCell: UITableViewCell {
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var btnRemove: UIButton!
    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblDateTime: UILabel!
}
