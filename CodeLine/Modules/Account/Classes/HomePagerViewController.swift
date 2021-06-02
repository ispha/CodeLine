//
//  NursingPagerViewController.swift
//  careMatePatient
//
//  Created by ispha on 9/30/20.
//  Copyright © 2020 khabeer. All rights reserved.
//

import UIKit

class HomePagerViewController: UIPageViewController , UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    
    var pageControl = UIPageControl()
    
    // MARK: UIPageViewControllerDataSource

    // var orderedViewControllers = [UIViewController]()
    private lazy var firstVC: MessagesViewController = {
          return  MessagesViewController(nibName: "MessagesViewController", bundle: nil)
      }()
    private lazy var secondtVC: CallsViewController = {
          return CallsViewController(nibName: "CallsViewController", bundle: nil)
      }()
    private lazy var thirdVC: ContactsViewController = {
          return ContactsViewController(nibName: "ContactsViewController", bundle: nil)
      }()
      private lazy var fourthVC: MyProfileViewController = {
          return MyProfileViewController(nibName: "MyProfileViewController", bundle: nil)
      }()
      private lazy var fifthVC: SettingsViewController
          = {
          return SettingsViewController(nibName: "SettingsViewController", bundle: nil)
      }()
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [firstVC,
                secondtVC,
                thirdVC,
                fourthVC,
                fifthVC]
    }()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: false,
                               completion: nil)
        }
 
      NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.refreshNow),
                                               name: NSNotification.Name(rawValue: "refreshNow"),
                                               object: nil)
       
       
        
     
        
        
       // configurePageControl()
 
        
        // Do any additional setup after loading the view.
    }
    @objc func refreshNow(_ notif: NSNotification){
        let newIndex =  notif.userInfo?["new_index"] as? Int
        //pageControl.currentPage = newIndex!
         let firstViewController = orderedViewControllers[newIndex!]
            setViewControllers([firstViewController],
                               direction: newIndex! > SingletoneClass.sharedInstance.currentIndex ? .reverse : .forward,
                               animated: true ,
                               completion: nil)
        SingletoneClass.sharedInstance.currentIndex = newIndex!
        
        
    }
    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        pageControl = UIPageControl(frame: CGRect(x: 0,y: UIScreen.main.bounds.maxY - 100,width: UIScreen.main.bounds.width,height: 50))
        self.pageControl.numberOfPages = orderedViewControllers.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.black
        self.pageControl.pageIndicatorTintColor = UIColor.white
        self.pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
    }
    
   
    
    
    // MARK: Delegate methords
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
         let pageContentViewController = pageViewController.viewControllers![0]
        print("😎 viewControllerIndex =\(orderedViewControllers.index(of: pageContentViewController)!)")
      /*  SingletoneClass.sharedInstance.faseelSegentedControl.currentState = orderedViewControllers.index(of: pageContentViewController)!
      */
        self.pageControl.currentPage = orderedViewControllers.index(of: pageContentViewController)!
    }
    
    // MARK: Data source functions.
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
       
        let previousIndex = viewControllerIndex - 1
        
        // User is on the first view controller and swiped left to loop to
        // the last view controller.
        guard previousIndex >= 0 else {
            return orderedViewControllers.last
            // Uncommment the line below, remove the line above if you don't want the page control to loop.
            // return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        
        let nextIndex = viewControllerIndex + 1
     
        let orderedViewControllersCount = orderedViewControllers.count
        
        // User is on the last view controller and swiped right to loop to
        // the first view controller.
        guard orderedViewControllersCount != nextIndex else {
            return orderedViewControllers.first
            // Uncommment the line below, remove the line above if you don't want the page control to loop.
            // return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    
    
    
}






/*
 PagerController, PagerDataSource, PagerDelegate {

    private lazy var FirstVC: HomeVisitViewController = {
        return HomeVisitViewController(nibName: "HomeVisitViewController", bundle: nil)
    }()
    private lazy var secondVC: NursingStep2ViewController = {
        return NursingStep2ViewController(nibName: "NursingStep2ViewController", bundle: nil)
    }()
    private lazy var thirdVC: NursingStep3ViewController
        = {
        return NursingStep3ViewController(nibName: "NursingStep3ViewController", bundle: nil)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SingletoneClass.sharedInstance.nursingPagerViewController = self
        self.dataSource = self
        self.delegate = self
        
        self.setupPager(
            tabNames: ["First Tab", "Second tab", "Third tab"],
            tabControllers: [FirstVC, secondVC, thirdVC])
        customizeTab()
        
    }

    // Customising the Tab's View
    func customizeTab() {
        indicatorColor = .blue
        tabsViewBackgroundColor = UIColor.gray.withAlphaComponent(0.1)
        contentViewBackgroundColor = UIColor.gray.withAlphaComponent(0.32)
        
        startFromSecondTab = false
        centerCurrentTab = true
        tabLocation = PagerTabLocation.top
        tabHeight = 0
        tabOffset = 0
        tabWidth = UIScreen.main.bounds.size.width/3
        fixFormerTabsPositions = false
        fixLaterTabsPosition = false
        animation = PagerAnimation.during
        selectedTabTextColor = .blue
        tabsTextColor = .black
        tabTopOffset = 0
        indicatorHeight = 0
        isRTL = false
        selectTabAtIndex(2)
        changeActiveTabIndex(2)
        self.
    }
    
    func didChangeTabToIndex(_ pager: PagerController, index: Int){
        print("selected tab index is \(index)")
    }

}

*/
