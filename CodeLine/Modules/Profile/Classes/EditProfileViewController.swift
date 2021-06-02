//
//  EditProfileViewController.swift
//  CodeLine
//
//  Created by ispha on 6/1/21.
//

import UIKit

class EditProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func closeAction(_ sender: Any) {
        dismiss(animated: true, completion: {
            HelpingMethods.showHideTabBar(flag: true)
        })
        // viewPopup.isHidden = true
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
