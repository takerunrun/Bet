//
//  ExploreCollectionViewCell.swift
//  Bet
//
//  Created by admin on 2018/05/05.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit
import SnapKit

class ExploreCollectionViewCell: UICollectionViewCell{
    
    private let backView = UIImageView()
    private let nameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backView.layer.masksToBounds = true
//        self.backView.layer.cornerRadius = 20
        self.backView.contentMode = .scaleAspectFit
        self.contentView.addSubview(self.backView)
        
        self.nameLabel.textAlignment = .left
        self.nameLabel.font = UIFont.hiraginoBold(size: 30)
        self.nameLabel.textColor = AppColor.beige
        self.contentView.addSubview(self.nameLabel)
        
        self.backView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
        self.nameLabel.snp.makeConstraints{ make in
            make.centerY.centerX.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(imageName: String, text: String) {
        self.backView.image = UIImage(named: imageName)
        self.nameLabel.text = "# " + text
    }
}
