//
//  SpruceTableViewControllerExample.swift
//  Spruce
//
//  Created by Jackson Taylor on 2/27/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import Spruce

class SpruceTableViewControllerExample: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let iconColors = [
        UIColor(red:0.67, green:0.91, blue:0.86, alpha:1.00),
        UIColor(red:0.72, green:0.86, blue:0.95, alpha:1.00),
        UIColor(red:0.97, green:0.76, blue:0.73, alpha:1.00),
        UIColor(red:0.96, green:0.82, blue:0.68, alpha:1.00),
        UIColor(red:0.98, green:0.92, blue:0.65, alpha:1.00),
        //UIColor(red:0.71, green:0.93, blue:0.80, alpha:1.00)
    ]
    
    let animations: [SpruceStandardAnimation]
    
    init(animations: [SpruceStandardAnimation]) {
        self.animations = animations
        super.init(nibName: "SpruceTableViewControllerExample", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.contentInset = UIEdgeInsets(top: 5.0, left: 0.0, bottom: 5.0, right: 0.0)
        tableView.register(UINib(nibName: "BaseExampleTableViewCell", bundle: nil), forCellReuseIdentifier: "baseCell")
        tableView.register(UINib(nibName: "ImageExampleTableViewCell", bundle: nil), forCellReuseIdentifier: "imageCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.sprucePrepare(withAnimations: animations)
        
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(callAnimation), userInfo: nil, repeats: false)
    }
    
    func callAnimation() {
        let sortFunction = LinearSortFunction(direction: .topToBottom, interObjectDelay: 0.05)
        let animation = SpringAnimation(duration: 0.7)
        DispatchQueue.main.async {
            self.tableView.spruceUp(withAnimations: self.animations, animationType: animation, sortFunction: sortFunction)
        }
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
