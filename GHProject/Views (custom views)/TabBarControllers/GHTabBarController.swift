//
//  GHTabBarController.swift
//  GHProject
//
//  Created by Софья Кравченко on 04.12.2024.
//

import UIKit

class GHTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        UITabBar.appearance().tintColor = .systemIndigo
        UITabBar.appearance().isTranslucent = false
        viewControllers = [createSearchNavigationController(), createFavouriteNavigationController()]
    }
    
    func createSearchNavigationController() -> UINavigationController{
        let searchVC = SearchVC()
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        return UINavigationController(rootViewController: searchVC)
    }
    
    func createFavouriteNavigationController() -> UINavigationController{
        let favourite = FavouriteListVC()
        favourite.title = "Favourite"
        favourite.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        return UINavigationController(rootViewController: favourite)
    }
}
