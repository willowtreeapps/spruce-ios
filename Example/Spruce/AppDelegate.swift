//
//  AppDelegate.swift
//  Spruce
//
//  Copyright (c) 2017 WillowTree, Inc.

//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:

//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.

//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let sortFunctionController = UIStoryboard(name: "SortFunctionTestViewController", bundle: Bundle.main).instantiateViewController(withIdentifier: "SortFunctionTestViewController")
        sortFunctionController.tabBarItem = UITabBarItem(title: "Sort Functions", image: UIImage(named: "ic_sortFunction"), tag: 0)
        sortFunctionController.tabBarItem.titlePositionAdjustment.vertical = -3.0
        
        
        let tableController = SpruceTableViewControllerExample(animations: [.slide(.left, .large), .fadeIn])
        tableController.tabBarItem = UITabBarItem(title: "Table View", image: UIImage(named: "ic_tableView"), tag: 0)
        tableController.tabBarItem.titlePositionAdjustment.vertical = -3.0
        
        let collectionViewController = SpruceCollectionViewExample(animations: [.slide(.up, .medium), .fadeIn])
        collectionViewController.tabBarItem = UITabBarItem(title: "Collection View", image: UIImage(named: "ic_collectionView"), tag: 0)
        collectionViewController.tabBarItem.titlePositionAdjustment.vertical = -3.0
        
        let tabBarController = UITabBarController()
        tabBarController.tabBar.barStyle = .black
        tabBarController.tabBar.barTintColor = UIColor(red:0.22, green:0.22, blue:0.20, alpha:1.00)
        tabBarController.tabBar.tintColor = UIColor.white
        tabBarController.viewControllers = [sortFunctionController, tableController, collectionViewController]
        
        let navController = UINavigationController(rootViewController: tabBarController)
        navController.navigationBar.barTintColor = UIColor.spruceGreen
        navController.navigationBar.tintColor = UIColor.white
        navController.navigationItem.title = "Spruce"
        
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        return true
    }

}

