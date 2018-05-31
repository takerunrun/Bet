//
//  NumberView.swift
//  Bet
//
//  Created by admin on 2018/05/06.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit
import SnapKit

class NumberView: UIView{
    
    let numberLabel = UILabel()
    let titleLabel = UILabel()
    let lineView = UIView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .clear
        
        
        self.addSubview(lineView)
        
        
        self.numberLabel.font = UIFont.hiraginoBold(size: 30)
        self.numberLabel.textAlignment = .center
        self.addSubview(self.numberLabel)
        
        
//        self.titleLabel.font = UIFont.hiragino(size: 12)
        self.titleLabel.font = UIFont.systemFont(ofSize: 12)
        self.titleLabel.textAlignment = .left
        self.addSubview(self.titleLabel)
        
        self.lineView.snp.makeConstraints{ make in
            make.width.equalTo(1)
            make.left.equalToSuperview().offset(10)
            make.height.equalTo(80)
            make.bottom.equalToSuperview()
        }
        self.numberLabel.snp.makeConstraints{ make in
            make.centerY.equalToSuperview().offset(-10)
            make.left.equalTo(self.lineView).offset(10)
        }
        self.titleLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.numberLabel.snp.bottom)
            make.left.equalTo(self.lineView).offset(10)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(number: Int, title: String, color: UIColor){
        self.numberLabel.text = String(number)
        self.titleLabel.text = title
        self.lineView.backgroundColor = color
        self.numberLabel.textColor = color
        self.titleLabel.textColor = color
        
    }
}

