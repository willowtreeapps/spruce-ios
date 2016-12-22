//
//  TestCollectionVIew.swift
//  Spruce
//
//  Created by Jackson Taylor on 11/8/16.
//  Copyright © 2016 WillowTree Apps, Inc. All rights reserved.
//

import UIKit
import Spruce

class TestCollectionView: UIViewController {

    var squaresPerRow: Int = 7

    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let flowLayout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: flowLayout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        view.addSubview(collectionView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        /*Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { _ in
            self.callAnimation()
        }*/
        callAnimation2()
    }
    
    func callAnimation() {
        let animation = SpringAnimation(duration: 0.5) { view in
            view.alpha = 1.0
            view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
        let sortFunction = RadialSortFunction(position: .middle, interObjectDelay: 0.05)
        //sortFunction.reversed = true
        //let sortFunction = CorneredSortFunction(corner: .topLeft, interObjectDelay: 0.05)
        //let sortFunction = LinearSortFunction(direction: .topToBottom, interObjectDelay: 0.05)
        collectionView.spruceSubViews(withSortFunction: sortFunction, animation: animation)
    }
    
    func callAnimation2() {
        collectionView.spruceUp(withAnimations: [.contract(.medium), .fadeIn], duration: 0.3)
    }
}

extension TestCollectionView: UICollectionViewDelegate {
    
}

extension TestCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 49
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor.spruceGreen
        cell.layer.cornerRadius = 2.0
        cell.clipsToBounds = true
        cell.isHidden = true
        return cell
    }
}

extension TestCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing: CGFloat = 3.0
        let frameWidth = view.bounds.size.width - (spacing * CGFloat(squaresPerRow - 1))
        let viewSize = (frameWidth / CGFloat(squaresPerRow))
        
        return CGSize(width: viewSize, height: viewSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3.0
    }
}
