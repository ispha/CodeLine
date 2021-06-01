//
//  MyProfileViewController.swift
//  CodeLine
//
//  Created by ispha on 5/31/21.
//

import UIKit

class MyProfileViewController: UIViewController {
    // MARK- outlets
    @IBOutlet weak var cv: UICollectionView!
    @IBOutlet weak var cv2: UICollectionView!
    @IBOutlet weak var viewPopup: UIView!
    @IBOutlet weak var viewSubscribe: UIView!
    @IBOutlet weak var viewSubmit: UIView!
    @IBOutlet weak var viewOccasion: UIView!
    @IBOutlet weak var viewUploadImg: UIView!
    @IBOutlet weak var imgVPopup: UIImageView!
    @IBOutlet weak var svCenterContraint: NSLayoutConstraint!
    @IBOutlet weak var cvCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var cvCenterConstraint2: NSLayoutConstraint!
    
    // MARK: - variables
    var arrayOfGallImages = [UIImage]()
    var count = 13
    var cellHeight : CGFloat = 0.0
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
        setImages()
    }
    func registerNibFiles()
    {
        cv.register(UINib(nibName: GalleryCollectionViewCell.identifier(), bundle: nil), forCellWithReuseIdentifier: GalleryCollectionViewCell.identifier())
        cv2.register(UINib(nibName: OccasionCollectionViewCell.identifier(), bundle: nil), forCellWithReuseIdentifier: OccasionCollectionViewCell.identifier())
        
        cv.register(UINib(nibName: AddNewCollectionViewCell.identifier(), bundle: nil), forCellWithReuseIdentifier: AddNewCollectionViewCell.identifier())
        cv2.register(UINib(nibName: AddNewCollectionViewCell.identifier(), bundle: nil), forCellWithReuseIdentifier: AddNewCollectionViewCell.identifier())
        
        
    }
    
    
    func setCollectionLayout() {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top:0,left:0,bottom:0,right:0)
        
        layout.itemSize = CGSize(width: cv.frame.size.width / 3 , height: cv.frame.size.width / 3)
        
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        cv.collectionViewLayout = layout
        
        let layout2:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout2.scrollDirection = .vertical
        layout2.sectionInset = UIEdgeInsets(top:0,left:0,bottom:0,right:0)
        cellHeight = cv2.frame.size.width / 3
        layout2.itemSize = CGSize(width: cv2.frame.size.width / 3 , height: cellHeight)
        
        layout2.minimumInteritemSpacing = 0
        layout2.minimumLineSpacing = 0
        cv2.collectionViewLayout = layout2
    }
    
    func setImages()
    {
        for i  in 0...11 {
            arrayOfGallImages.append(UIImage(named: "gallery_\(i)")!)
        }
        cv.reloadData()
        cv2.reloadData()
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    @IBAction func buyProject(_ sender: Any) {
        HelpingMethods.showHideTabBar(flag: false)
        showHide(index: 0)
    }
    @IBAction func editProfile(_ sender: Any) {
        HelpingMethods.showHideTabBar(flag: false)
        let editProfileViewController  = EditProfileViewController(nibName: "EditProfileViewController", bundle: nil)
        editProfileViewController.modalPresentationStyle = .fullScreen
         self.present(editProfileViewController, animated: true, completion: {
             HelpingMethods.showHideTabBar(flag: false)
         })
    }
    @IBAction func closeAction(_ sender: Any) {
        viewPopup.fadeOut()
        // viewPopup.isHidden = true
    }
    @IBAction func subscribe(_ sender: Any) {
        showHide(index: 1)
    }
    @IBAction func submit(_ sender: Any) {
        showHide(index: 2)
    }
    @IBAction func postImage(_ sender: Any) {
        showHide(index: 3)
    }
    @IBAction func postOccasion(_ sender: Any) {
        showHide(index: -1)
        HelpingMethods.showHideTabBar(flag: true)
    }
    func showHide(index:Int)
    {
        viewPopup.isHidden = true
        viewSubscribe.isHidden = index != 0
        viewSubmit.isHidden = index != 1
        viewUploadImg.isHidden = index != 2
        viewOccasion.isHidden = index != 3
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
            self.cvCenterConstraint.constant = index == 1 ? 0 : self.view.frame.size.width
            
            self.svCenterContraint.constant = index == 0 ? 0 : -self.view.frame.size.width
            
            self.cvCenterConstraint2.constant = index == 2 ? 0: self.view.frame.size.width
            
            self.view.layoutIfNeeded()
        })
    }
}
extension MyProfileViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AddNewCollectionViewCell.identifier(), for: indexPath) as! AddNewCollectionViewCell
            cell.contentView.backgroundColor = .clear
            cell.lblTitle.text = collectionView == cv ? "New Image" :
                "Occasion"
            cell.backgroundColor = .clear
            return cell
        }
        else
        {
            if collectionView == cv
            {
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryCollectionViewCell.identifier(), for: indexPath) as! GalleryCollectionViewCell
                cell.contentView.backgroundColor = .clear
                cell.imgv.image = arrayOfGallImages[indexPath.item]
                cell.backgroundColor = .clear
                return cell
            }
            else
            {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OccasionCollectionViewCell.identifier(), for: indexPath) as! OccasionCollectionViewCell
                cell.contentView.backgroundColor = .clear
                cell.imgv.image =   UIImage(named: indexPath.item % 2 == 0 ? "occasion_icon_1" :
                                                "occasion_icon_2")
                cell.lblTitle.text = indexPath.item % 2 != 0 ? "Wedding" :
                    "Birthday"
                cell.backgroundColor = .clear
                return cell
            }
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfGallImages.count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item != 0
        {
            if collectionView == cv
            {
                imgVPopup.image = arrayOfGallImages[indexPath.item]
                //viewPopup.isHidden = false
                viewPopup.fadeIn()
            }
            else
            {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OccasionCollectionViewCell.identifier(), for: indexPath) as! OccasionCollectionViewCell
                imgVPopup.image = cell.imgv.image
                //viewPopup.isHidden = false
                viewPopup.fadeIn()
            }
        }
        
    }
    
}
