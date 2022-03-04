//
//  MainTabController.swift
//  InstargramFirestoreTutorial
//
//  Created by 장혜령 on 2022/02/16.
//

import UIKit
import Firebase

class MainTabController: UITabBarController{
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
        checkIfUserLoggedIn()
    }
    
    // MARK: - API
    
    func checkIfUserLoggedIn(){
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let nav = UINavigationController(rootViewController: LoginController())
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }
        }
    }
    
    
    //MARK: - Helpers
    
    func configureViewControllers(){
        tabBar.backgroundColor = .gray
        
        let layout = UICollectionViewFlowLayout()
        let feed = templateNavigationController(unselectedImage: ImageLiterals.icHomeUnselected,
                                                  selectedImage: ImageLiterals.icHomeSelected,
                                                  rootViewController: FeedController(collectionViewLayout: layout))
        
        let search = templateNavigationController(unselectedImage: ImageLiterals.icSearchSelected,
                                                  selectedImage: ImageLiterals.icSearchSelected,
                                                  rootViewController: SearchController())
        
        let imageSelector = templateNavigationController(unselectedImage: ImageLiterals.icPlusUnselected,
                                                         selectedImage: ImageLiterals.icPlusUnselected,
                                                         rootViewController: ImageSelectorController())
               
        let notification = templateNavigationController(unselectedImage: ImageLiterals.icLikeUnselected,
                                                        selectedImage: ImageLiterals.icLikeSelected,
                                                        rootViewController: NotificationController())
                           
        let profile = templateNavigationController(unselectedImage: ImageLiterals.icProfileUnselected,
                                                        selectedImage: ImageLiterals.icProfileSelected,
                                                        rootViewController: ProfileController())
                           
        viewControllers = [feed, search, imageSelector, notification, profile]
        tabBar.tintColor = .black
    }
    
    func templateNavigationController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tintColor = .black
        return nav
    }
}
