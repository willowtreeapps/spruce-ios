//
//  SpruceCollectionViewExample.swift
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

class SpruceCollectionViewExample: ExampleViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    let iconColors = [
        UIColor(red:0.67, green:0.91, blue:0.86, alpha:1.00),
        UIColor(red:0.72, green:0.86, blue:0.95, alpha:1.00),
        UIColor(red:0.97, green:0.76, blue:0.73, alpha:1.00),
        UIColor(red:0.96, green:0.82, blue:0.68, alpha:1.00),
        UIColor(red:0.98, green:0.92, blue:0.65, alpha:1.00),
        UIColor(red:0.71, green:0.93, blue:0.80, alpha:1.00)
    ]
    
    init(animations: [StockAnimation]) {
        super.init(animations: animations, nibName: "SpruceCollectionViewExample")
        
        sortFunction = CorneredSortFunction(corner: .topLeft)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setup() {
        collectionView.contentInset = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
        collectionView.register(UINib(nibName: "BaseExampleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "baseCell")
        
        animationView = collectionView
    }
}

extension SpruceCollectionViewExample: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "baseCell", for: indexPath)
        if let cell = cell as? BaseExampleCollectionViewCell {
            cell.iconView.backgroundColor = iconColors[indexPath.item % iconColors.count]
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80.0, height: 100.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
}
