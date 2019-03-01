//
//  SwipingExtension.swift
//  ProgrammaticallyLayout
//
//  Created by Buse ERKUŞ on 28.02.2019.
//  Copyright © 2019 Buse ERKUŞ. All rights reserved.
//

import UIKit

extension SwipingController{
     override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        collectionViewLayout.invalidateLayout()
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()
            
            if self.pageControl.currentPage == 0 {
                self.collectionView.contentOffset = .zero
            }else{
                let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
                self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
        }) { (_) in
            
        }
    }
    
    
    
    
}

    

