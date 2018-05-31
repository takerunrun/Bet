//
//  ImageCollectionCell.swift
//  Bet
//
//  Created by admin on 2018/04/29.
//  Copyright © 2018年 admin. All rights reserved.
//

import Foundation
import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    let thumbnailView = UIImageView()
//    let favoriteButton = FavoriteButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        thumbnailView.layer.cornerRadius = 5
        thumbnailView.clipsToBounds = true
        
        self.contentView.addSubview(self.thumbnailView)
        
//        self.contentView.addSubview(self.favoriteButton)
        
        self.thumbnailView.snp.makeConstraints({ make in
            make.edges.equalToSuperview()
        })
        
//        self.favoriteButton.snp.makeConstraints({ make in
//            make.right.bottom.equalToSuperview().offset(-4)
//            make.height.width.equalTo(30)
//        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func setFavoriteButtonHidden(_ bool: Bool) {
//        self.favoriteButton.isHidden = bool
//    }
    
}
