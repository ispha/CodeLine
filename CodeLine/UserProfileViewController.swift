//
//  UserProfileViewController.swift
//  CodeLine
//
//  Created by ispha on 5/27/21.
//

import UIKit

class UserProfileViewController: UIViewController {
    // MARK- outlets
    @IBOutlet weak var cv: UICollectionView!
    @IBOutlet weak var svCenterContraint: NSLayoutConstraint!
    @IBOutlet weak var cvCenterConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Do any additional setup after sloading the view.
        doAnyAdditionalSetup()
    }
    func doAnyAdditionalSetup()
    {
        registerNibFiles()
        setCollectionLayout()
        setConstraints(index: 0)
    }
    func registerNibFiles()
    {
        cv.register(UINib(nibName: GalleryCollectionViewCell.identifier(), bundle: nil), forCellWithReuseIdentifier: GalleryCollectionViewCell.identifier())
    }
    func setCollectionLayout() {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top:0,left:0,bottom:0,right:0)
        
        layout.itemSize = CGSize(width: cv.frame.size.width / 3 , height: cv.frame.size.width / 3)
        
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
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func actionOfSc(_ sender: Any) {
       setConstraints(index: (sender as! UISegmentedControl).selectedSegmentIndex)
    }
    @IBAction func actionOfPDetails(_ sender: Any) {
        let projectDetailsViewController  = ProjectDetailsViewController(nibName: "ProjectDetailsViewController", bundle: nil)
        projectDetailsViewController.modalPresentationStyle = .overCurrentContext
         self.present(projectDetailsViewController, animated: true, completion: {
             HelpingMethods.showHideTabBar(flag: false)
         })
    }
    func setConstraints(index:Int)
    {
        UIView.animate(withDuration: 0.5, animations: {
            self.cvCenterConstraint.constant = index == 0 ? self.view.frame.size.width : 0
            
            self.svCenterContraint.constant = index != 0 ? -self.view.frame.size.width : 0
            self.view.layoutIfNeeded()
        })
    }
}
extension UserProfileViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryCollectionViewCell.identifier(), for: indexPath) as! GalleryCollectionViewCell
            cell.contentView.backgroundColor = .clear
           // (cell.viewWithTag(5) as! UIImageView).image = UIImage(named: "OnBoarding_\(indexPath.item)")
            cell.backgroundColor = .clear
            return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
  
}
