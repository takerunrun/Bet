//
//  MenuCollectionViewCell.swift
//  Bet
//
//  Created by admin on 2018/05/08.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit
import SnapKit

class MenuCollectionViewCell: UICollectionViewCell{
    
    private let backView = UIImageView()
    private let nameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10
        
        self.backView.contentMode = .scaleAspectFill
        self.contentView.addSubview(self.backView)
        
        self.nameLabel.textAlignment = .left
        self.nameLabel.font = UIFont.hiraginoBold(size: 13)
        self.nameLabel.textColor = AppColor.textGray
        self.contentView.addSubview(self.nameLabel)
        
        self.backView.snp.makeConstraints{ make in
            make.top.width.centerX.equalToSuperview()
            make.height.equalTo(self.backView.snp.width)
        }
        self.nameLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.backView.snp.bottom)
            make.centerX.equalToSuperview()
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
