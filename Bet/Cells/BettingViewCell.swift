//
//  BettingViewCell.swift
//  Bet
//
//  Created by admin on 2018/04/29.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class BettingViewCell: UITableViewCell {
    private let logoImageView = UIImageView()
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = AppColor.black
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    private var dateLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = AppColor.black
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    private var priceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = AppColor.black
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    
    // MARK: -
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        self.layer.masksToBounds = true
//        self.layer.cornerRadius = 20
        
        let logoWidth: CGFloat = 40
        self.logoImageView.layer.cornerRadius = logoWidth / 2
        self.logoImageView.layer.masksToBounds = true
        self.contentView.addSubview(self.logoImageView)
        
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.dateLabel)
        self.contentView.addSubview(self.priceLabel)

        // レイアウト
        self.logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16)
            make.left.equalTo(self.contentView.snp.leftMargin)
            make.bottom.lessThanOrEqualToSuperview().inset(16)
            make.size.equalTo(logoWidth)
        }
        
        self.titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.logoImageView)
            make.left.equalTo(self.logoImageView.snp.right).offset(16)
            make.right.lessThanOrEqualTo(self.contentView.snp.rightMargin)
        }
        self.dateLabel.snp.makeConstraints { make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(10)
            make.left.equalTo(self.logoImageView.snp.right).offset(16)
            make.right.lessThanOrEqualTo(self.contentView.snp.rightMargin)
        }
        self.priceLabel.snp.makeConstraints { make in
            make.top.equalTo(self.dateLabel.snp.bottom).offset(10)
            make.left.equalTo(self.logoImageView.snp.right).offset(16)
            make.right.lessThanOrEqualTo(self.contentView.snp.rightMargin)
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func set(_ title: String, date: String, price: String) {
        self.logoImageView.image = #imageLiteral(resourceName: "home_filled")
        self.titleLabel.text = title
        self.dateLabel.text = date
        self.priceLabel.text = price
        
    }
    
}
