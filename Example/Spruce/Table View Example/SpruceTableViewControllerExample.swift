//
//  SpruceTableViewControllerExample.swift
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
import Spruce

class SpruceTableViewControllerExample: ExampleViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let iconColors = [
        UIColor(red:0.67, green:0.91, blue:0.86, alpha:1.00),
        UIColor(red:0.72, green:0.86, blue:0.95, alpha:1.00),
        UIColor(red:0.97, green:0.76, blue:0.73, alpha:1.00),
        UIColor(red:0.96, green:0.82, blue:0.68, alpha:1.00),
        UIColor(red:0.98, green:0.92, blue:0.65, alpha:1.00),
        //UIColor(red:0.71, green:0.93, blue:0.80, alpha:1.00)
    ]
    
    init(animations: [SpruceStockAnimation]) {
        super.init(animations: animations, nibName: "SpruceTableViewControllerExample")
        
        sortFunction = LinearSortFunction(direction: .topToBottom, interObjectDelay: 0.05)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setup() {
        tableView.contentInset = UIEdgeInsets(top: 5.0, left: 0.0, bottom: 5.0, right: 0.0)
        tableView.register(UINib(nibName: "BaseExampleTableViewCell", bundle: nil), forCellReuseIdentifier: "baseCell")
        tableView.register(UINib(nibName: "ImageExampleTableViewCell", bundle: nil), forCellReuseIdentifier: "imageCell")
        
        animationView = tableView
    }
}

extension SpruceTableViewControllerExample: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return iconColors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath)
        if let cell = cell as? ImageExampleTableViewCell {
            cell.iconView.backgroundColor = iconColors[indexPath.item]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110.0
    }
}

extension SpruceTableViewControllerExample: UITableViewDelegate {
    
}
