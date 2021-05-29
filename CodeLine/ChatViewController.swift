//
//  ChatViewController.swift
//  CodeLine
//
//  Created by ispha on 5/27/21.
//

import UIKit

class ChatViewController: UIViewController {
    
    // MARK- outlets
    @IBOutlet weak var tv: UITableView!
    @IBOutlet weak var typingConstraintH: NSLayoutConstraint!
    @IBOutlet weak var vTyping: UIView!
    @IBOutlet weak var imgvTyping: UIImageView!
    
  
    // MARK- variables
    var arrayOfChatMsgs : [ChatMsgModel]?
    var rotation = 90
    var timer : Timer?
    var timer2 : Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after sloading the view.
        doAnyAdditionalSetup()
    }
    func doAnyAdditionalSetup()
    {
       
        registerNibFiles()
        setData()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        timer2 = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(fireTimer2), userInfo: nil, repeats: true)
    }
    @objc func fireTimer2() {
        imgvTyping.transform = CGAffineTransform(rotationAngle: CGFloat(rotation))
        if rotation == 360
        {
            rotation = 90
        }
        else
        {
        rotation += 90
        }
    }
    @objc func fireTimer() {
      
        UIView.animate(withDuration: 0.2, animations: {
           self.typingConstraintH.constant = self.typingConstraintH.constant == 54 ? 0 : 54
            self.view.layoutIfNeeded()
        })
        print("Timer fired!")
    }
    func registerNibFiles()
    {
        tv.register(UINib(nibName: TextTableViewCell_ToMe.identifier(), bundle: nil), forCellReuseIdentifier: TextTableViewCell_ToMe.identifier())
        
        tv.register(UINib(nibName: TextTableViewCell_FromMe.identifier(), bundle: nil), forCellReuseIdentifier: TextTableViewCell_FromMe.identifier())
        
        tv.register(UINib(nibName: AudioTableViewCell_FromMe.identifier(), bundle: nil), forCellReuseIdentifier: AudioTableViewCell_FromMe.identifier())
        
        
    }
    func setData()
    {
        arrayOfChatMsgs = [ChatMsgModel]()
        arrayOfChatMsgs?.append(ChatMsgModel(fromMe: true, msg: "Hi Salam, how are you today?", isAudio: false))
        arrayOfChatMsgs?.append(ChatMsgModel(fromMe: false , msg: "Hi Salam, how are you today?", isAudio: false))
        arrayOfChatMsgs?.append(ChatMsgModel(fromMe: true, msg: "Hi ", isAudio: false))
        arrayOfChatMsgs?.append(ChatMsgModel(fromMe: true, msg: "Hi bro, you here?", isAudio: false))
        arrayOfChatMsgs?.append(ChatMsgModel(fromMe: false , msg: "Of Course, we can meet today ASAP", isAudio: false))
        arrayOfChatMsgs?.append(ChatMsgModel(fromMe: true, msg: "", isAudio: true))
        arrayOfChatMsgs?.append(ChatMsgModel(fromMe: false , msg: "Of Course, we can meet today ASAP", isAudio: false))
        tv.reloadData()
    }
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func profileAction(_ sender: Any) {
        let userProfileViewController  = UserProfileViewController(nibName: "UserProfileViewController", bundle: nil)
        userProfileViewController.modalPresentationStyle = .fullScreen
         self.present(userProfileViewController, animated: true, completion: {
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
    override func viewWillDisappear(_ animated: Bool) {
        if timer != nil{
            timer?.invalidate()
        }
        if timer2 != nil{
            timer2?.invalidate()
        }
        HelpingMethods.showHideTabBar(flag: true)
    }
}

extension ChatViewController : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (arrayOfChatMsgs![indexPath.row]).fromMe ?? true == true
        {
            if  (arrayOfChatMsgs![indexPath.row]).isAudio ?? true == true
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: AudioTableViewCell_FromMe.identifier()) as! AudioTableViewCell_FromMe
                
                cell.selectionStyle = .none
                return cell
            }
            else
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: TextTableViewCell_FromMe.identifier()) as! TextTableViewCell_FromMe
                cell.lblText.text = arrayOfChatMsgs![indexPath.row].msg ?? "---"
                cell.selectionStyle = .none
                return cell
            }
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: TextTableViewCell_ToMe.identifier()) as! TextTableViewCell_ToMe
            cell.lblText.text = arrayOfChatMsgs![indexPath.row].msg ?? "---"
            cell.selectionStyle = .none
            return cell
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfChatMsgs?.count ?? 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
}

struct ChatMsgModel:Codable
{
    var fromMe:Bool?
    var msg:String?
    var isAudio:Bool?
}
