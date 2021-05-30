//
//  CallsViewController.swift
//  CodeLine
//
//  Created by ispha on 5/27/21.
//

import UIKit

class CallsViewController: UIViewController {
    
    // MARK- outlets
    @IBOutlet weak var tv: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after sloading the view.
        doAnyAdditionalSetup()
    }
    func doAnyAdditionalSetup()
    {
        registerNibFiles()
       
    }
    func registerNibFiles()
    {
        tv.register(UINib(nibName: CallsTableViewCell.identifier(), bundle: nil), forCellReuseIdentifier: CallsTableViewCell.identifier())
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

extension CallsViewController : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CallsTableViewCell.identifier()) as! CallsTableViewCell
        cell.imgv_call.image = UIImage(named: indexPath.row % 2 == 0 ? "call_video_icon" : "call_audio_icon")
        cell.imgv_person.image = UIImage(named: indexPath.row % 2 == 0 ? "call_out_sample" : "call_in_sample")
        cell.imgv_in_out.image = UIImage(named: indexPath.row % 2 == 0 ? "call_out" : "call_in")
        cell.lbl_name.text =  indexPath.row % 2 == 0 ? "Mayada Salem" : "Salma Mousa"
        cell.selectionStyle = .none
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let chatViewController  = CallingViewController(nibName: "CallingViewController", bundle: nil)
        chatViewController.modalPresentationStyle = .fullScreen
        self.present(chatViewController, animated: true, completion: {
            HelpingMethods.showHideTabBar(flag: false)
        })
    }
}
