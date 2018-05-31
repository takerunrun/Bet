//
//  FriendsCell.swift
//  Bet
//
//  Created by admin on 2018/05/02.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class FriendsCell: UITableViewCell{
    
    private let iconView = UIImageView()
    private let nameLabel = UILabel()
    private var tagLabels: [UILabel] = []
    private let followButton = DefaultButton()
    
    // MARK: -
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.iconView.layer.masksToBounds = true
        self.iconView.layer.cornerRadius = 30
        self.iconView.contentMode = .scaleAspectFill
        self.contentView.addSubview(self.iconView)
        
        self.nameLabel.textAlignment = .left
        self.nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        self.nameLabel.textColor = AppColor.textGray
        self.contentView.addSubview(self.nameLabel)
        
        for i in 0...1{
            let label = UILabel()
            label.font = UIFont.hiraginoBold(size: 12)
            label.textColor = AppColor.lineGray
            self.addSubview(label)
            self.tagLabels.append(label)
            if i == 0 {
                label.text = "# bnech_press"
            } else {
                label.text = "# squat"
            }
        }
        
        self.followButton.set(title: "follow", color: .clear, font: .hiraginoBold(size: 20), cornerRadius: 5)
        self.followButton.setTitleColor(AppColor.green, for: .normal)
        self.followButton.layer.borderColor = AppColor.green.cgColor
        self.followButton.layer.borderWidth = 2
        self.addSubview(self.followButton)
        
        self.iconView.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.left.greaterThanOrEqualToSuperview().offset(10)
            make.width.height.equalTo(60)
        }
        self.nameLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(20)
            make.left.equalTo(self.iconView.snp.right).offset(15)
        }
        for (i, ele) in self.tagLabels.enumerated(){
            ele.snp.makeConstraints{ make in
                make.left.equalTo(self.nameLabel).offset(10)
                make.top.equalTo(self.nameLabel.snp.bottom).offset(10 + 20 * i)
            }
        }
        self.followButton.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalTo(100)
            make.right.equalToSuperview().offset(-30)
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
