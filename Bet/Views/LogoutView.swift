//
//  LogoutView.swift
//  Bet
//
//  Created by admin on 2018/05/08.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit
import SnapKit

class LogoutView: UITableViewHeaderFooterView{
    
    let logoutButton = DefaultButton()
    
    override init(reuseIdentifier: String?){
        super.init(reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = AppColor.beige
        
        self.logoutButton.set(title: "ログアウト", color: .green, font: .hiraginoBold(size: 18), cornerRadius: 5)
        self.addSubview(self.logoutButton)
        
        self.logoutButton.snp.makeConstraints{ make in
            make.center.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(200)
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
