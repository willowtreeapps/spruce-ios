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
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
        
        let cellText: String
        switch indexPath.row {
        case 0:
            cellText = "Sort functions"
        case 1:
            cellText = "Spruce Default Animation (fadeIn, expand, spin, slideUp)"
        case 2:
            cellText = "SpruceButton Example (grow)"
        case 3:
            cellText = "SpruceButton Example (grow, bounce)"
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
            let tempController = UIStoryboard(name: "SortFunctionTestViewController", bundle: Bundle.main).instantiateViewController(withIdentifier: "SortFunctionTestViewController")
            controller = tempController
        case 1:
            let tempController = TestViewController2(nibName: nil, bundle: nil)
            controller = tempController
        case 2:
            let tempController = TestViewController3(nibName: nil, bundle: nil)
            controller = tempController
        case 3:
            let tempController = SpruceButtonBounceViewController(nibName: nil, bundle: nil)
            controller = tempController
        default:
            let tempController = UIStoryboard(name: "SortFunctionTestViewController", bundle: Bundle.main).instantiateViewController(withIdentifier: "SortFunctionTestViewController")
            controller = tempController
        }
        navigationController?.pushViewController(controller, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
