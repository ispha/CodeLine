//
//  GroupViewController.swift
//  CodeLine
//
//  Created by ispha on 5/30/21.
//

import UIKit

class GroupViewController: UIViewController {
    
    // MARK- outlets
    @IBOutlet weak var tv: UITableView!
    
    // MARK: - variables
    var arrayOfGallImages = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after sloading the view.
        doAnyAdditionalSetup()
    }
    func doAnyAdditionalSetup()
    {
        registerNibFiles()
       setImages()
    }
    func registerNibFiles()
    {
        
        tv.register(UINib(nibName: ParticipantaTableViewCell.identifier(), bundle: nil), forCellReuseIdentifier: ParticipantaTableViewCell.identifier())
    }
    func setImages()
    {
        for i  in 0...11 {
            arrayOfGallImages.append(UIImage(named: "gallery_\(i)")!)
        }
        tv.reloadData()
    }
    @IBAction func backAction(_ sender: Any) {
        HelpingMethods.showHideTabBar(flag: true)
        self.dismiss(animated: true, completion: nil)
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

extension GroupViewController : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ParticipantaTableViewCell.identifier()) as! ParticipantaTableViewCell
        cell.imgv_person.image = arrayOfGallImages[indexPath.row]
        cell.lbl_name.text =  indexPath.row % 2 == 0 ? "Mayada Salem" : "Salma Mousa"
        cell.imgv_call.image = UIImage(named: indexPath.row % 2 == 0 ? "radio_on" : "radio_off")
        cell.imgv_in_out.isHidden = true 
        cell.selectionStyle = .none
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfGallImages.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    /*func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: ContactTableViewCell.identifier()) as! ContactTableViewCell
        headerCell.imgv_person.image = UIImage(named: "ppl_icon")
        headerCell.backgroundColor = .clear
        headerCell.lbl_name.text = "New Group Chat"
        headerCell.imgvConstraintHeight.constant = 30
        return headerCell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }*/
    /*func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let chatViewController  = ChatViewController(nibName: "ChatViewController", bundle: nil)
        chatViewController.modalPresentationStyle = .fullScreen
        self.present(chatViewController, animated: true, completion: {
            HelpingMethods.showHideTabBar(flag: false)
        })
    }*/
}
