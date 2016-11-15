//
//  TestCollectionVIew.swift
//  Spruce
//
//  Created by Jackson Taylor on 11/8/16.
//  Copyright © 2016 WillowTree Apps, Inc. All rights reserved.
//

import UIKit

class TestCollectionView: UIViewController {
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
        collectionView.spruceUp(withAnimations: [.contractMedium, .fadeIn], duration: 0.3)
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
        cell.backgroundColor = .blue
        cell.isHidden = true
        return cell
    }
}

extension TestCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let viewSize = (self.view.bounds.size.width / 7.0)
        return CGSize(width: viewSize, height: viewSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}
