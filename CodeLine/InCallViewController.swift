//
//  InCallViewController.swift
//  CodeLine
//
//  Created by ispha on 5/30/21.
//

import UIKit

class InCallViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func actionOfbtnend(_ sender: Any) {
        let projectDetailsViewController  = ParticipantsViewController(nibName: "ParticipantsViewController", bundle: nil)
        projectDetailsViewController.modalPresentationStyle = .overCurrentContext
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
