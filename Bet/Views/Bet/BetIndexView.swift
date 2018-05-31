//
//  BetIndexView.swift
//  Bet
//
//  Created by admin on 2018/04/29.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit
import SnapKit

class BetIndexView: UIView {
    
    let titleLabel = UILabel()
    
//    let imageCollectionView = ImageCollectionView()
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(){
        super.init(frame: .zero)
        
        self.backgroundColor = .white
        self.titleLabel.baselineAdjustment = .alignCenters
        self.titleLabel.textAlignment = .center
        self.titleLabel.textColor = AppColor.black
        self.titleLabel.font = UIFont.athelas(size: 20)
        self.addSubview(self.titleLabel)
        
//       self.addSubview(self.imageCollectionView)
        
        self.titleLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(16)
            make.centerX.equalToSuperview()
            make.height.equalTo(23)
        }
        
        
//        self.imageCollectionView.snp.makeConstraints{ make in
//            make.top.equalTo(self.titleLabel.snp.bottom).offset(16)
//            make.left.equalToSuperview().offset(16)
//            make.width.centerX.equalToSuperview()
//            make.height.equalTo(136)
//        }
        
        
        
    }
    
    func set(title: String){
        self.titleLabel.text = title
    }
    
}
