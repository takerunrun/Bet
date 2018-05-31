//
//  NotificationCell.swift
//  Bet
//
//  Created by admin on 2018/05/03.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class NotificationCell: UITableViewCell{
    
    private let iconView = UIImageView()
    private let nameLabel = UILabel()
    
    // MARK: -
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.iconView.layer.masksToBounds = true
        self.iconView.layer.cornerRadius = 20
        self.iconView.contentMode = .scaleAspectFill
        self.contentView.addSubview(self.iconView)
        
        self.nameLabel.textAlignment = .left
        self.nameLabel.font = UIFont.hiragino(size: 16)
        self.nameLabel.textColor = AppColor.textLightGray
        self.contentView.addSubview(self.nameLabel)
        
        self.iconView.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.left.greaterThanOrEqualToSuperview().offset(10)
            make.width.height.equalTo(40)
        }
        self.nameLabel.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.left.equalTo(self.iconView.snp.right).offset(10)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -
    func set() {
        self.iconView.image = #imageLiteral(resourceName: "snoopy")
        self.nameLabel.text = "unknown"
    }
}


