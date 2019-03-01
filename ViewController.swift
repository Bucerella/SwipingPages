//
//  ViewController.swift
//  ProgrammaticallyLayout
//
//  Created by Buse ERKUŞ on 26.02.2019.
//  Copyright © 2019 Buse ERKUŞ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let bearImageView : UIImageView = {
       let iv = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
       iv.translatesAutoresizingMaskIntoConstraints = false
       iv.contentMode = .scaleAspectFit
       return iv
    }()
    let descText : UITextView = {
        let dt = UITextView()
        let attributedText = NSMutableAttributedString(string: "Join us today in our fun and games!", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        attributedText.append(NSAttributedString(string: "\n\nAre you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon.", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        dt.attributedText = attributedText
        dt.textAlignment = .center
        dt.isEditable = false
        dt.isScrollEnabled = true
        dt.translatesAutoresizingMaskIntoConstraints = false
        return dt
    }()
    private let previousButton : UIButton = {
       let button = UIButton(type: .system)
       button.setTitle("Prev", for: .normal)
       button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor.gray, for: .normal)
       button.translatesAutoresizingMaskIntoConstraints = false
       return button
    }()
    private let nextButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.mainPink, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let pageControl: UIPageControl = {
       let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        return pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(descText)
        setupBottomControls()
        setupLayout()
    
    }
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
    
    private func setupLayout() {
        let topImageContainerView = UIView()
        //        topImageContainerView.backgroundColor = .blue
        view.addSubview(topImageContainerView)
        //enable auto layout
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        topImageContainerView.addSubview(bearImageView)
        bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        bearImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        descText.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        descText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        descText.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    
}

extension UIColor {
    static var mainPink = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
    
}
