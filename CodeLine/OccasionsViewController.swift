//
//  OccasionsViewController.swift
//  CodeLine
//
//  Created by ispha on 5/28/21.
//

import UIKit

class OccasionsViewController: UIViewController {
    // MARK- outlets
    @IBOutlet weak var tv: UITableView!
    
    // MARK- variables
    var arrayOfOccasionModels : [OccasionModel]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        doAnyAdditionalSetup()
    }
    func doAnyAdditionalSetup()
    {
        registerNibFiles()
        setData()
    }
    
    func registerNibFiles()
    {
        tv.register(UINib(nibName: OccasionsTableViewCell.identifier(), bundle: nil), forCellReuseIdentifier: OccasionsTableViewCell.identifier())
    }
    func setData()
    {
        arrayOfOccasionModels = [OccasionModel]()
        arrayOfOccasionModels?.append(OccasionModel(birthday: true, msg: "Say Happy Birthday To Said..",desc: "25 Years Old",text: "Said El Sheikh's Birthday"))
        arrayOfOccasionModels?.append(OccasionModel(birthday: false, msg: "Say Congratulations",desc: "2 Years From Wedding Date",text: "Said El Sheikh's Wedding"))
        arrayOfOccasionModels?.append(OccasionModel(birthday: true,msg: "Say Happy Birthday To Said..", desc: "25 Years Old",text: "Said El Sheikh's Birthday"))
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
extension OccasionsViewController : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OccasionsTableViewCell.identifier()) as! OccasionsTableViewCell
        let occasionItem = arrayOfOccasionModels![indexPath.row]
        
        cell.imgv.image = UIImage(named: occasionItem.birthday ?? true ? "occasion_icon_1" : "occasion_icon_2")
        cell.lblText.text = occasionItem.text ?? ""
        cell.lblDesc.text = occasionItem.desc ?? ""
        cell.btn.setTitle(occasionItem.msg ?? "" , for: .normal)
        
        cell.selectionStyle = .none
        return cell
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfOccasionModels!.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
}

struct OccasionModel:Codable
{
    var birthday:Bool?
    var msg:String?
    var desc:String?
    var text:String?
}
