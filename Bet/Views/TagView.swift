//
//  TagView.swift
//  Bet
//
//  Created by admin on 2018/05/06.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit
import SnapKit

class TagView: UITableViewHeaderFooterView{
    
    let backView = UIImageView()
    let tagLabel = UILabel()
    let memberLabel = UILabel()
    var iconViews: [UIImageView] = []
    
    let postsView = NumberView()
    let eraiView = NumberView()
    let peopleView = NumberView()
    
    override init(reuseIdentifier: String?){
        super.init(reuseIdentifier: reuseIdentifier)
        
        
        self.backgroundColor = AppColor.green
        
        self.backView.contentMode = .scaleAspectFill
        self.addSubview(backView)
        
        self.tagLabel.textColor = AppColor.beige
        self.tagLabel.font = UIFont.hiraginoBold(size: 50)
        self.addSubview(self.tagLabel)
        
        self.memberLabel.textColor = AppColor.beige
        self.memberLabel.font = UIFont.hiragino(size: 20)
        self.memberLabel.text = "member"
        self.addSubview(self.memberLabel)
        
        self.postsView.set(number: 324, title: "Posts", color: AppColor.beige)
        self.addSubview(self.postsView)
        
        self.eraiView.set(number: 3408, title: "えらい", color: AppColor.beige)
        self.addSubview(self.eraiView)
        
        self.peopleView.set(number: 2948, title: "People", color: AppColor.beige)
        self.addSubview(self.peopleView)
        
        for _ in 0 ... 5{
            let imageView = UIImageView()
            imageView.layer.masksToBounds = true
            imageView.layer.cornerRadius = 20
            imageView.contentMode = .scaleToFill
            imageView.image = #imageLiteral(resourceName: "snoopy")
            self.addSubview(imageView)
            self.iconViews.append(imageView)
        }
        
        
        self.backView.snp.makeConstraints{ make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        self.tagLabel.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
        }
        self.memberLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.tagLabel.snp.bottom).offset(60)
            make.centerX.equalToSuperview().dividedBy(2)
        }
        for (i, ele) in self.iconViews.enumerated(){
            ele.snp.makeConstraints{ make in
                make.top.equalTo(self.memberLabel.snp.bottom).offset(20)
                make.height.width.equalTo(40)
                make.left.equalTo(self.memberLabel).offset(50 * i)
            }
        }
        self.postsView.snp.makeConstraints{ make in
            make.left.bottom.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalToSuperview().dividedBy(3)
        }
        self.eraiView.snp.makeConstraints{ make in
            make.left.equalTo(self.postsView.snp.right)
            make.bottom.equalToSuperview()
            make.height.width.equalTo(self.postsView)
        }
        self.peopleView.snp.makeConstraints{ make in
            make.right.bottom.equalToSuperview()
            make.height.width.equalTo(self.postsView)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(tag: String, imageName: String){
        self.tagLabel.text = "# " + tag
        self.backView.image = UIImage(named: imageName)
    }
}

