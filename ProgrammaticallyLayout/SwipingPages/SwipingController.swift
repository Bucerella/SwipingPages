//
//  SwipingController.swift
//  ProgrammaticallyLayout
//
//  Created by Buse ERKUŞ on 27.02.2019.
//  Copyright © 2019 Buse ERKUŞ. All rights reserved.
//

import UIKit


class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let pages = [
        Page(imageName: "bear_first", headerText: "Join use today in our fun and games!", bodyText: "Get notified of the savings immediately when we announce them on our website. Make sure to also give us any feedback you have."),
        Page(imageName: "heart_second", headerText: "Subscribe and get coupons on our daily events", bodyText: "Are you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon."),
        Page(imageName: "leaf_third", headerText: "VIP members special services", bodyText: "Get notified of the savings immediately when we announce them on our website. Make sure to also give us any feedback you have."),
        Page(imageName: "bear_first", headerText: "Join use today in our fun and games!", bodyText: "Are you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon."),
        Page(imageName: "heart_second", headerText: "Subscribe and get coupons on our daily events", bodyText: "Get notified of the savings immediately when we announce them on our website. Make sure to also give us any feedback you have."),
        Page(imageName: "leaf_third", headerText: "VIP members special services", bodyText: "Are you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon.")
    ]
    
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return button
    }()
    
    @objc private func handlePrev() {
        let nextIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainPink, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    @objc private func handleNext() {
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        return pc
    }()
    
    fileprivate func setupBottomControls() {
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
        
        pageControl.currentPage = Int(x / view.frame.width)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBottomControls()
        
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView?.isPagingEnabled = true
    }
    
}
