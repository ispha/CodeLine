//
//  CallingViewController.swift
//  CodeLine
//
//  Created by ispha on 5/30/21.
//

import UIKit

class CallingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func actionOfbtnend(_ sender: Any) {
        let projectDetailsViewController  = RingingViewController(nibName: "RingingViewController", bundle: nil)
        projectDetailsViewController.modalPresentationStyle = .fullScreen
         self.present(projectDetailsViewController, animated: true, completion: {
             HelpingMethods.showHideTabBar(flag: false)
         })
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
