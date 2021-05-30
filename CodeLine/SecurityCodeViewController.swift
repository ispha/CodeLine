//
//  SecurityCodeViewController.swift
//  CodeLine
//
//  Created by ispha on 5/29/21.
//

import UIKit

class SecurityCodeViewController: UIViewController {
    // MARK- outlets
    @IBOutlet weak var viewPopup: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        doAnyAdditionalSetup()
    }
    func doAnyAdditionalSetup()
    {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.viewPopup.isHidden = false
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
