//
//  ProjectDetailsViewController.swift
//  CodeLine
//
//  Created by ispha on 5/28/21.
//

import UIKit

class ProjectDetailsViewController: UIViewController {
    // MARK- outlets
    @IBOutlet weak var cv: UICollectionView!
    @IBOutlet weak var cvConstraintH: NSLayoutConstraint!
    @IBOutlet weak var outletOfConstraintH: NSLayoutConstraint!
    @IBOutlet weak var outletOfScrollView: UIScrollView!
    @IBOutlet weak var outletOfViewDrag: UIView!
    @IBOutlet weak var outletOfViewHeader: UIView!
    @IBOutlet weak var outletOfViewFooter: UIView!
    
    // MARK: - variables
    var panGesture = UIPanGestureRecognizer()
    var count = 13
    var cellHeight : CGFloat = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        doAnyAdditionalSetup()
    }
    func doAnyAdditionalSetup()
    {
        registerNibFiles()
        setCollectionLayout()
        setCvDynamicHeight()
    }
    func registerNibFiles()
    {
         cv.register(UINib(nibName: GalleryCollectionViewCell.identifier(), bundle: nil), forCellWithReuseIdentifier: GalleryCollectionViewCell.identifier())
        
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(ProjectDetailsViewController.draggedView(_:)))
        outletOfViewDrag.isUserInteractionEnabled = true
        outletOfViewDrag.addGestureRecognizer(panGesture)
    }
    func setCvDynamicHeight()
    {
        cv.isScrollEnabled = false
        cvConstraintH.constant = cellHeight * CGFloat((count/3) + (count%3))
    }
    func setCollectionLayout() {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top:0,left:0,bottom:0,right:0)
        cellHeight = cv.frame.size.width / 3
        layout.itemSize = CGSize(width: cv.frame.size.width / 3 , height: cellHeight)

        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        cv.collectionViewLayout = layout
    }
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @objc func draggedView(_ sender:UIPanGestureRecognizer){
        self.view.bringSubviewToFront(outletOfViewDrag)
        let translation = sender.translation(in: self.view)
        if outletOfViewDrag.center.y + translation.y > outletOfViewHeader.frame.origin.y + outletOfViewHeader.frame.size.height + 10 && outletOfViewDrag.center.y + translation.y < outletOfViewFooter.frame.origin.y + 20
        {
            outletOfViewDrag.center = CGPoint(x: outletOfViewDrag.center.x , y: outletOfViewDrag.center.y + translation.y)
            print("outletOfViewDrag.center.y=\(outletOfViewDrag.center.y)")
            //outletOfScrollView.frame.origin.y = outletOfScrollView.frame.origin.y + translation.y
            outletOfConstraintH.constant = outletOfConstraintH.constant - translation.y// CGPoint(x: outletOfScrollView.center.x , y: outletOfScrollView.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: self.view)
        }
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
extension ProjectDetailsViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryCollectionViewCell.identifier(), for: indexPath) as! GalleryCollectionViewCell
            cell.contentView.backgroundColor = .clear
           // (cell.viewWithTag(5) as! UIImageView).image = UIImage(named: "OnBoarding_\(indexPath.item)")
            cell.backgroundColor = .clear
            return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let occasionsViewController  = OccasionsViewController(nibName: "OccasionsViewController", bundle: nil)
        occasionsViewController.modalPresentationStyle = .fullScreen
         self.present(occasionsViewController, animated: true, completion: {
             HelpingMethods.showHideTabBar(flag: false)
         })
    }
  
}
