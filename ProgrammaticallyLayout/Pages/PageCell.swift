//
//  PageCell.swift
//  ProgrammaticallyLayout
//
//  Created by Buse ERKUŞ on 27.02.2019.
//  Copyright © 2019 Buse ERKUŞ. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet{
            guard let unwrappedPage = page else { return }
            bearImageView.image = UIImage(named: page!.imageName)
            
            let attributedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            attributedText.append(NSAttributedString(string: "\n\n\(unwrappedPage.bodyText)", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
            descText.attributedText = attributedText
            descText.textAlignment = .center
        }
    }
    
    private let bearImageView : UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private let descText : UITextView = {
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        
        let topImageContainer = UIView()
        addSubview(topImageContainer)
        topImageContainer.translatesAutoresizingMaskIntoConstraints = false
        
        topImageContainer.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        topImageContainer.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainer.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        topImageContainer.addSubview(bearImageView)
        bearImageView.centerXAnchor.constraint(equalTo: topImageContainer.centerXAnchor).isActive = true
        bearImageView.centerYAnchor.constraint(equalTo: topImageContainer.centerYAnchor).isActive = true
        bearImageView.heightAnchor.constraint(equalTo: topImageContainer.heightAnchor, multiplier: 0.5).isActive = true
        
        topImageContainer.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        topImageContainer.addSubview(bearImageView)
        
        bearImageView.centerXAnchor.constraint(equalTo: topImageContainer.centerXAnchor).isActive = true
        bearImageView.centerYAnchor.constraint(equalTo: topImageContainer.centerYAnchor).isActive = true
        bearImageView.heightAnchor.constraint(equalTo: topImageContainer.heightAnchor, multiplier: 0.5).isActive = true
        
        addSubview(descText)
        
        descText.topAnchor.constraint(equalTo: topImageContainer.bottomAnchor).isActive = true
        descText.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        descText.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        descText.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }

    
    
}
