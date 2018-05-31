//
//  WorkOutCell.swift
//  Bet
//
//  Created by admin on 2018/05/06.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class WorkOutCell: UITableViewCell{
    
    private let iconView = UIImageView()
    private let nameLabel = UILabel()
    private let tagButton = DefaultButton()
    private let proudImageView = UIImageView()
    private let numberOfProud = UILabel()
    private let proudButton = DefaultButton()
    
    // MARK: -
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = AppColor.beige

        self.iconView.contentMode = .scaleAspectFit
        self.iconView.layer.masksToBounds = true
        self.iconView.layer.cornerRadius = 10
        self.contentView.addSubview(self.iconView)
        
        self.nameLabel.textAlignment = .left
        self.nameLabel.font = UIFont.hiraginoBold(size: 15)
        self.nameLabel.textColor = AppColor.textGray
        self.contentView.addSubview(self.nameLabel)
        
        self.tagButton.set(title: "", color: .clear, font: .hiraginoBold(size: 13), cornerRadius: 5)
        self.contentView.addSubview(self.tagButton)
        
        self.proudImageView.image = #imageLiteral(resourceName: "proud")
        self.proudImageView.contentMode = .scaleAspectFit
        self.contentView.addSubview(self.proudImageView)
        
        self.numberOfProud.font = UIFont.hiragino(size: 16)
        self.numberOfProud.textAlignment = .left
        self.addSubview(self.numberOfProud)
        
        self.proudButton.set(title: "I'm Proud Of You", color: .green, font: .hiraginoBold(size: 13), cornerRadius: 10)
        self.addSubview(self.proudButton)
        
        self.iconView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.width.equalTo(50)
        }
        self.nameLabel.snp.makeConstraints{ make in
            make.left.top.equalToSuperview().offset(20)
        }
        self.tagButton.snp.makeConstraints{ make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(self.nameLabel.snp.bottom)
            make.height.equalTo(30)
            make.width.equalTo(150)
        }
        self.proudImageView.snp.makeConstraints{ make in
            make.left.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-30)
            make.height.width.equalTo(30)
        }
        self.numberOfProud.snp.makeConstraints{ make in
            make.left.equalTo(self.proudImageView.snp.right).offset(20)
            make.bottom.equalTo(self.proudImageView)
        }
        self.proudButton.snp.makeConstraints{ make in
            make.right.bottom.equalToSuperview().offset(-30)
            make.height.equalTo(30)
            make.width.equalTo(200)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -
    func set(name: String) {
        self.iconView.image = #imageLiteral(resourceName: "udetate")
        self.nameLabel.text = name
        self.tagButton.setTitle("# Bench Press", for: .normal)
        self.numberOfProud.text = "2938"
    }
}

