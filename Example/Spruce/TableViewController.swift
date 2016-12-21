//
//  TableViewController.swift
//  Spruce
//
//  Created by Jackson Taylor on 11/15/16.
//  Copyright © 2016 WillowTree Apps, Inc. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.frame = view.bounds
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "basicCell")
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
}

extension TableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
        
        let cellText: String
        switch indexPath.row {
        case 0:
            cellText = "Cornered Sort Function (top-left)"
        case 1:
            cellText = "Cornered Sort Function (bottom-right)"
        case 2:
            cellText = "Cornered Sort Function (top-right)"
        case 3:
            cellText = "Radial Sort Function"
        case 4:
            cellText = "Radial Sort Function (reversed)"
        case 5:
            cellText = "Linear Sort Function (bottom-to-top)"
        case 6:
            cellText = "Linear Sort Function (top-to-bottom)"
        case 7:
            cellText = "Linear Sort Function (left-to-right)"
        case 8:
            cellText = "Collection View Example"
        case 9:
            cellText = "Spruce Default Animation (fadeIn, expand, spin, slideUp)"
        case 10:
            cellText = "SpruceButton Example (grow)"
        case 11:
            cellText = "SpruceButton Example (grow, bounce)"
        case 12:
            cellText = "Inline Sort Function (top-left)"
        case 13:
            cellText = "Weighted continuous sort function (top-left, heavy, light)"
        case 14:
            cellText = "Weighted continuous sort function (middle, light, heavy)"
        default:
            cellText = ""
        }
        
        cell.textLabel?.text = cellText
        cell.textLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 14.0)
        return cell
    }
    
    @objc(tableView:heightForRowAtIndexPath:) func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller: UIViewController
        switch indexPath.row {
        case 0:
            let tempController = TestViewController(nibName: nil, bundle: nil)
            tempController.corner = .topLeft
            controller = tempController
        case 1:
            let tempController = TestViewController(nibName: nil, bundle: nil)
            tempController.corner = .bottomRight
            controller = tempController
        case 2:
            let tempController = TestViewController(nibName: nil, bundle: nil)
            tempController.corner = .topRight
            controller = tempController
        case 3:
            let tempController = TestRadialViewController(nibName: nil, bundle: nil)
            tempController.reversed = false
            controller = tempController
        case 4:
            let tempController = TestRadialViewController(nibName: nil, bundle: nil)
            tempController.reversed = true
            controller = tempController
        case 5:
            let tempController = TestLinearViewController(nibName: nil, bundle: nil)
            tempController.direction = .bottomToTop
            controller = tempController
        case 6:
            let tempController = TestLinearViewController(nibName: nil, bundle: nil)
            tempController.direction = .topToBottom
            controller = tempController
        case 7:
            let tempController = TestLinearViewController(nibName: nil, bundle: nil)
            tempController.direction = .leftToRight
            controller = tempController
        case 8:
            let tempController = TestCollectionView(nibName: nil, bundle: nil)
            controller = tempController
        case 9:
            let tempController = TestViewController2(nibName: nil, bundle: nil)
            controller = tempController
        case 10:
            let tempController = TestViewController3(nibName: nil, bundle: nil)
            controller = tempController
        case 11:
            let tempController = SpruceButtonBounceViewController(nibName: nil, bundle: nil)
            controller = tempController
        case 12:
            let tempController = TestInlineViewController(nibName: nil, bundle: nil)
            controller = tempController
        case 13:
            let tempController = TestWeightedContinuousViewController(nibName: nil, bundle: nil)
            controller = tempController
        case 14:
            let tempController = TestWeightedContinuousViewController2(nibName: nil, bundle: nil)
            controller = tempController
        default:
            let tempController = TestViewController(nibName: nil, bundle: nil)
            controller = tempController
        }
        navigationController?.pushViewController(controller, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
