//
//  SettingsVC.swift
//  VoiceMint
//
//  Created by test on 29/08/25.
//

import UIKit
import StoreKit
import SafariServices

class SettingsVC: UIViewController {

    @IBOutlet weak var tbleVw: UITableView!
    var arr = [["Theme"],["Background Play","Rate Us","Share App","Help","More App"],["Privacy Policy", "Terms of Usage"]]
    var arrImg = [["circle.lefthalf.fill"],["speaker.wave.2.circle","heart.circle","arrowshape.turn.up.forward.circle","questionmark.circle","iphone.homebutton.circle"],["hand.raised.circle", "backpack.circle"]]
    var arrHeader = ["Theme","Other","Legal"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
    }
    
    @objc func modeAction(_ sender: UISegmentedControl) {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if let keyWindow = windowScene.windows.first {
                switch sender.selectedSegmentIndex {
                case 0:
                    Constants.USERDEFAULTS.set(0, forKey: "isMode")
                    keyWindow.overrideUserInterfaceStyle = .unspecified
                case 1:
                    Constants.USERDEFAULTS.set(1, forKey: "isMode")
                    keyWindow.overrideUserInterfaceStyle = .light
                case 2:
                    Constants.USERDEFAULTS.set(2, forKey: "isMode")
                    keyWindow.overrideUserInterfaceStyle = .dark
                default:
                    print(sender.selectedSegmentIndex)
                }
            }
        }
    }
    
    func setupTable() {
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        let customView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.IpadorIphone(value: 50)))
        customView.backgroundColor = .clear
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.IpadorIphone(value: 50)))
        label.text = "Version  \(appVersion!)"
        label.textAlignment = .center
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.font = UIFont(name: "AvenirNext-Medium", size: IpadorIphone(value: 16))
        customView.addSubview(label)
        tbleVw.tableFooterView = customView
    }

}

extension SettingsVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        arr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arr[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tbleVwCell", for: indexPath) as! tbleVwCell
        cell.selectionStyle = .none
        cell.accessoryType = .disclosureIndicator
        cell.segment.isHidden = true
        cell.swtch.isHidden = true
        if indexPath.row == 0  && indexPath.section == 0 {
            cell.segment.isHidden = false
            cell.accessoryType = .none
            let selectedSegmentAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.white]
            let segmentAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.label]
            cell.segment.setTitleTextAttributes(selectedSegmentAttributes, for: .selected)
            cell.segment.setTitleTextAttributes(segmentAttributes, for: .normal)
            cell.segment.selectedSegmentIndex = Constants.USERDEFAULTS.integer(forKey: "isMode")
            cell.segment.addTarget(self, action: #selector(modeAction(_:)), for: .valueChanged)
            if(UIDevice.current.userInterfaceIdiom == .pad) {
                cell.segment.setFontSize(fontSize: 25)
            }
        }
        if indexPath.row == 0  && indexPath.section == 1 {
            cell.swtch.isHidden = false
            cell.accessoryType = .none
        }
        cell.lblTitle.text = arr[indexPath.section][indexPath.row]
        cell.imgView.image = UIImage(systemName: arrImg[indexPath.section][indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 1:
            switch indexPath.row {
            case 1:
                if let scene = view.window?.windowScene {
                    SKStoreReviewController.requestReview(in: scene)
                }
            case 2: break
            case 3: break
            default: break
                
            }
        default:
            switch indexPath.row {
            case 0:
                if let url = URL(string: Constants.PRIVACY) {
                    let controller = SFSafariViewController(url: url)
                    controller.delegate = self
                    present(controller, animated: true, completion: nil)
                }
            default:
                if let url = URL(string: Constants.TERMS) {
                    let controller = SFSafariViewController(url: url)
                    controller.delegate = self
                    present(controller, animated: true, completion: nil)
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return IpadorIphone(value: 50)
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 30))
        let label = UILabel(frame: .init(x: IpadorIphone(value: 5), y: IpadorIphone(value: 15), width: IpadorIphone(value: 100), height: IpadorIphone(value: 20)))
        label.text = self.arrHeader[section]
        label.font = UIFont(name: "AvenirNext-Medium", size: IpadorIphone(value: 16))
        label.textColor = .init(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        headerView.addSubview(label)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return IpadorIphone(value: 50)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
}

extension SettingsVC: SFSafariViewControllerDelegate{
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}



class tbleVwCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var swtch: UISwitch!
    
}
