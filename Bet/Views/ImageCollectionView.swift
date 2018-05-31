//
//  ImageCollectionView.swift
//  Bet
//
//  Created by admin on 2018/04/29.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class ImageCollectionView: UICollectionView {
    
    private let layout = UICollectionViewFlowLayout()
    
    // MARK: -
    init() {
        
        // Cell一つ一つの大きさ.
        self.layout.itemSize = CGSize(width:106, height:136)
        
        // Cellのマージン.
        self.layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        self.layout.minimumLineSpacing = 6
        self.layout.minimumInteritemSpacing = 6
        
        self.layout.scrollDirection = .horizontal
        
        super.init(
            frame: CGRect.zero,
            collectionViewLayout: self.layout)
        
        self.backgroundColor = .white
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
