//
//  MessagesViewController.swift
//  CodeLine
//
//  Created by ispha on 5/26/21.
//

import UIKit

class MessagesViewController: UIViewController {

    // MARK- outlets
    @IBOutlet weak var cv: UICollectionView!
    @IBOutlet weak var tv: UITableView!
    @IBOutlet weak var viewPopup: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after sloading the view.
        doAnyAdditionalSetup()
    }
    func doAnyAdditionalSetup()
    {
        registerNibFiles()
        setCollectionLayout()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.viewPopup.isHidden = true
        })
    }
    func registerNibFiles()
    {
        cv.register(UINib(nibName: MessageCollectionViewCell.identifier(), bundle: nil), forCellWithReuseIdentifier: MessageCollectionViewCell.identifier())
        cv.register(UINib(nibName: MessageAddCollectionViewCell.identifier(), bundle: nil), forCellWithReuseIdentifier: MessageAddCollectionViewCell.identifier())
        tv.register(UINib(nibName: MessageTableViewCell.identifier(), bundle: nil), forCellReuseIdentifier: MessageTableViewCell.identifier())


    }
    func setCollectionLayout() {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top:0,left:0,bottom:0,right:0)
        
        layout.itemSize = CGSize(width: 90, height:90)
        
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        cv.collectionViewLayout = layout
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
extension MessagesViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MessageAddCollectionViewCell.identifier(), for: indexPath) as! MessageAddCollectionViewCell
            cell.contentView.backgroundColor = .clear
           // (cell.viewWithTag(5) as! UIImageView).image = UIImage(named: "OnBoarding_\(indexPath.item)")
            cell.backgroundColor = .clear
            return cell
        }
        else
        {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MessageCollectionViewCell.identifier(), for: indexPath) as! MessageCollectionViewCell
        cell.contentView.backgroundColor = .clear
        //(cell.viewWithTag(5) as! UIImageView).image = UIImage(named: "OnBoarding_\(indexPath.item)")
        cell.backgroundColor = .clear
        return cell
    }
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
  
}

extension MessagesViewController : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MessageTableViewCell.identifier()) as! MessageTableViewCell
        cell.imgv_marks.isHidden = indexPath.row % 2 == 0
        cell.view_number.isHidden = !cell.imgv_marks.isHidden
        
        cell.selectionStyle = .none
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let chatViewController  = ChatViewController(nibName: "ChatViewController", bundle: nil)
        chatViewController.modalPresentationStyle = .fullScreen
        self.present(chatViewController, animated: true, completion: {
            HelpingMethods.showHideTabBar(flag: false)
        })
    }
}
