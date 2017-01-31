//
//  TableViewController.swift
//  Spruce
//
//  Created by Jackson Taylor on 11/15/16.
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
