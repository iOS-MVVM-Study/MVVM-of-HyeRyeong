//
//  MainTabController.swift
//  InstargramFirestoreTutorial
//
//  Created by 장혜령 on 2022/02/16.
//

import UIKit

class MainTabController: UITabBarController{
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
    }
    
    //MARK: - Helpers
    
    func configureViewControllers(){
        tabBar.backgroundColor = .gray
        let feed = FeedController()
        let search = SearchController()
        let imageSelector = ImageSelectorController()
        let notification = NotificationController()
        let profile = ProfileController()
        
        viewControllers = [feed, search, imageSelector, notification, profile]
    }
}
