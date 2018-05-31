//
//  ExploreCell.swift
//  Bet
//
//  Created by admin on 2018/05/05.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class ExploreCell: UITableViewCell{
    
    private let backView = UIImageView()
    private let nameLabel = UILabel()
    
    // MARK: -
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backView.layer.masksToBounds = true
        self.backView.layer.cornerRadius = 20
        self.backView.contentMode = .scaleAspectFit
        self.contentView.addSubview(self.backView)
        
        self.nameLabel.textAlignment = .left
        self.nameLabel.font = UIFont.hiraginoBold(size: 30)
        self.nameLabel.textColor = .white
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
    
    // MARK: -
    func set(text: String) {
        self.backView.image = #imageLiteral(resourceName: "udetate")
        self.nameLabel.text = "# " + text
    }
}
