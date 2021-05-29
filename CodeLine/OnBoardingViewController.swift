//
//  OnBoardingViewController.swift
//  CodeLine
//
//  Created by ispha on 5/25/21.
//

import UIKit

class OnBoardingViewController: UIViewController {

    // MARK- outlets
    @IBOutlet weak var cv: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        doAnyAdditionalSetup()
    }
    func doAnyAdditionalSetup()
    {
        registerNibFiles()
        setCollectionLayout()
    }
    func registerNibFiles()
    {
        cv.register(UINib(nibName: OnBoardingCollectionViewCell.identifier(), bundle: nil), forCellWithReuseIdentifier: OnBoardingCollectionViewCell.identifier())
        
    }
    func setCollectionLayout() {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top:0,left:0,bottom:0,right:0)
        
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height:cv.frame.size.height - 20)
        
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
extension OnBoardingViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnBoardingCollectionViewCell.identifier(), for: indexPath) as! OnBoardingCollectionViewCell
        cell.contentView.backgroundColor = .clear
        (cell.viewWithTag(5) as! UIImageView).image = UIImage(named: "OnBoarding_\(indexPath.item)")
        cell.backgroundColor = .clear
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
  
}
