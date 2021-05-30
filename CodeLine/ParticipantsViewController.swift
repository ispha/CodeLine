//
//  ParticipantsViewController.swift
//  CodeLine
//
//  Created by ispha on 5/30/21.
//

import UIKit

class ParticipantsViewController: UIViewController {
    
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

extension ParticipantsViewController : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ParticipantaTableViewCell.identifier()) as! ParticipantaTableViewCell
        cell.imgv_call.image = UIImage(named: indexPath.row % 2 == 0 ? "cam_on" : "cam_off")
        cell.imgv_person.image = arrayOfGallImages[indexPath.row]
        cell.imgv_in_out.image = UIImage(named: "mic_on")
        cell.lbl_name.text =  indexPath.row % 2 == 0 ? "Mayada Salem" : "Salma Mousa"
        cell.selectionStyle = .none
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfGallImages.count
    }
    /*func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let chatViewController  = ChatViewController(nibName: "ChatViewController", bundle: nil)
        chatViewController.modalPresentationStyle = .fullScreen
        self.present(chatViewController, animated: true, completion: {
            HelpingMethods.showHideTabBar(flag: false)
        })
    }*/
}
