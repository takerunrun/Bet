//
//  ProfileView.swift
//  Bet
//
//  Created by admin on 2018/05/05.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit
import SnapKit

class ProfileView: UIView{
    
    let backViewButton = UIButton()
    let iconButton = UIButton()
    let followingView = FollowView()
    let followingButton = DefaultButton()
    let followerView = FollowView()
    let followerButton = DefaultButton()
    let nameLabel = UILabel()
    
    let followButton = DefaultButton()
    
    let postsView = NumberView()
    let eraiView = NumberView()
    let tagsView = NumberView()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        self.backgroundColor = AppColor.beige
        
//        let v = UIImageView()
//        let url = "http://160.16.66.221/images/profile.jpg"
//        v.kf.setImage(with: URL(string: url))
//        let im = v.image
        
        self.backViewButton.setImage(#imageLiteral(resourceName: "profileBack"), for: .normal)
//        self.backViewButton.setImage(im, for: .normal)
        self.backViewButton.imageView?.contentMode = .scaleAspectFill
        self.addSubview(self.backViewButton)
        
        self.iconButton.setImage(#imageLiteral(resourceName: "profile"), for: .normal)
        self.iconButton.layer.masksToBounds = true
        self.iconButton.layer.cornerRadius = 10
        self.iconButton.layer.borderColor = UIColor.white.cgColor
        self.iconButton.layer.borderWidth = 2
        self.addSubview(self.iconButton)
        
        self.followingView.set(number: 428, title: "following")
        self.addSubview(self.followingView)
        self.followingButton.set(title: "", color: .clear, font: .hiragino(size: 0), cornerRadius: 30)
        self.addSubview(self.followingButton)
        
        self.followerView.set(number: 7362, title: "follower")
        self.addSubview(self.followerView)
        self.followerButton.set(title: "", color: .clear, font: .hiragino(size: 0), cornerRadius: 30)
        self.addSubview(self.followerButton)
        
        self.nameLabel.text = "AKIHIRO KOKUBO"
        self.nameLabel.font = UIFont.hiraginoBold(size: 18)
        self.nameLabel.textColor = AppColor.textDarkGray
        self.addSubview(self.nameLabel)
        
        self.followButton.set(title: "Follow", color: .green, font: .hiragino(size: 15), cornerRadius: 5)
        self.addSubview(self.followButton)
        
        self.postsView.set(number: 324, title: "Posts", color: AppColor.textGray)
        self.addSubview(self.postsView)
        
        self.eraiView.set(number: 3408, title: "えらい", color: AppColor.textGray)
        self.addSubview(self.eraiView)
        
        self.tagsView.set(number: 2948, title: "tag", color: AppColor.textGray)
        self.addSubview(self.tagsView)
        
        
        self.backViewButton.snp.makeConstraints{ make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(200)
        }
        
        self.iconButton.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.height.width.equalTo(150)
            make.top.equalTo(self.backViewButton.snp.bottom).offset(-50)
        }
        self.followingView.snp.makeConstraints{ make in
            make.centerY.equalTo(self.iconButton).offset(40)
            make.centerX.equalToSuperview().dividedBy(3)
        }
        self.followingButton.snp.makeConstraints{ make in
            make.centerY.centerX.equalTo(self.followingView)
            make.height.width.equalTo(100)
        }
        self.followerView.snp.makeConstraints{ make in
            make.centerY.equalTo(self.followingView)
            make.centerX.equalToSuperview().multipliedBy(1.7)
        }
        self.followerButton.snp.makeConstraints{ make in
            make.centerY.centerX.equalTo(self.followerView)
            make.height.width.equalTo(100)
        }
        self.nameLabel.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.iconButton.snp.bottom).offset(20)
        }
        self.followButton.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.nameLabel.snp.bottom).offset(30)
            make.height.equalTo(30)
            make.width.equalTo(150)
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
        self.tagsView.snp.makeConstraints{ make in
            make.right.bottom.equalToSuperview()
            make.height.width.equalTo(self.postsView)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class FollowView: UIView{
    
    let numberLabel = UILabel()
    let titleLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = AppColor.lineGray
        
        self.numberLabel.textColor = AppColor.textGray
        self.numberLabel.font = UIFont.boldSystemFont(ofSize: 25)
        self.numberLabel.textAlignment = .center
        self.addSubview(self.numberLabel)
        
        self.titleLabel.textColor = AppColor.textGray
        self.titleLabel.font = UIFont.systemFont(ofSize: 12)
        self.titleLabel.textAlignment = .center
        self.addSubview(self.titleLabel)
        
        self.numberLabel.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.snp.centerY)
        }
        self.titleLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.numberLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(number: Int, title: String){
        self.numberLabel.text = String(number)
        self.titleLabel.text = title
    }
}



