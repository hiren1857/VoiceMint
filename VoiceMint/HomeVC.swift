//
//  HomeVC.swift
//  VoiceMint
//
//  Created by test on 28/08/25.
//

import UIKit
import AVFAudio

class HomeVC: UIViewController {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var textVw1: UITextView!
    @IBOutlet weak var speakBtn1: UIButton!
    @IBOutlet weak var saveBtn1: UIButton!
    @IBOutlet weak var reloadBtn1: UIButton!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var pdfVw: UIView!
    @IBOutlet weak var imageVw: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var textVw2: UITextView!
    @IBOutlet weak var speakBtn2: UIButton!
    @IBOutlet weak var saveBtn2: UIButton!
    @IBOutlet weak var reloadBtn2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HomeVC.btnDropShadow(views: [speakBtn1,saveBtn1,reloadBtn1,speakBtn2,saveBtn2,reloadBtn2,view1,textVw1,view2,pdfVw,imageVw,view3,textVw2])
                
    }

}
