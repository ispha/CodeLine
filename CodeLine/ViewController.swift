//
//  ViewController.swift
//  CodeLine
//
//  Created by ispha on 5/24/21.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK- outlets
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var v1: UIView!
    @IBOutlet weak var v2: UIView!
    @IBOutlet weak var v3: UIView!
    @IBOutlet weak var v4: UIView!
    @IBOutlet weak var v5: UIView!
    
    @IBOutlet weak var tabBarView: UIView!
    @IBOutlet weak var tabBarInnerView: DesignableUIView!
    @IBOutlet weak var tabBarConstraintBtom: NSLayoutConstraint!
    
    @IBOutlet weak var btn3ConstraintTop: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
       doAnyAdditionalSetup()
    }
    func doAnyAdditionalSetup()
    {
        SingletoneClass.sharedInstance.tabbarView = tabBarView
        SingletoneClass.sharedInstance.tabBarInnerView = tabBarInnerView
        SingletoneClass.sharedInstance.tabbarConstraintBotm = tabBarConstraintBtom
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        btn3ConstraintTop.constant = -btn3.frame.size.height / 2
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    func showHideBasedOnIndex(index:Int)
    {
        v1.isHidden = true
        v2.isHidden = true
        v3.isHidden = true
        v4.isHidden = true
        v5.isHidden = true
        switch index {
        case 1:
            v1.isHidden = false
            break
        case 2:
            v2.isHidden = false
            break
        case 3:
            v3.isHidden = false
            break
        case 4:
            v4.isHidden = false
            break
        case 5:
            v5.isHidden = false
            break
        default:
            break
        }
    }
    // MARK- Actions
    @IBAction func actionofbtn1(_ sender: Any) {
        showHideBasedOnIndex(index: 1)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "refreshNow"), object: self, userInfo: ["new_index":0])
    }
    @IBAction func actionofbtn2(_ sender: Any) {
        showHideBasedOnIndex(index: 2)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "refreshNow"), object: self, userInfo: ["new_index":1])
    }
    @IBAction func actionofbtn3(_ sender: Any) {
        showHideBasedOnIndex(index: 3)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "refreshNow"), object: self, userInfo: ["new_index":2])
    }
    @IBAction func actionofbtn4(_ sender: Any) {
        showHideBasedOnIndex(index: 4)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "refreshNow"), object: self, userInfo: ["new_index":3])
    }
    @IBAction func actionofbtn5(_ sender: Any) {
        showHideBasedOnIndex(index: 5)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "refreshNow"), object: self, userInfo: ["new_index":4])
    }
    
}

