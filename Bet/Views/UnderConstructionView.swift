//
//  UnderConstructionView.swift
//  Bet
//
//  Created by admin on 2018/05/05.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit
import SnapKit

class UnderConstructionView: UIView{
    
    let constructionImageView = UIImageView()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        self.backgroundColor = AppColor.green
        
        self.constructionImageView.image = #imageLiteral(resourceName: "construction1")
        self.constructionImageView.contentMode = .scaleAspectFit
        self.addSubview(constructionImageView)
        
        self.constructionImageView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
