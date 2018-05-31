//
//  LoginView.swift
//  Bet
//
//  Created by admin on 2018/05/08.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit
import SnapKit

class ImageSwipeView: UIView{
    let pageControl = UIPageControl()
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let signupButton = DefaultButton()
    let loginButton = DefaultButton()
    
    var imageViews: [UIImageView] = []
    
    private let imageViewMargin: CGFloat = 0
    
    init() {
        
        super.init(frame: .zero)
        
        self.backgroundColor = .white
        
        // 縦方向と、横方向のインディケータを非表示にする.
        self.scrollView.showsHorizontalScrollIndicator = false
        self.scrollView.showsVerticalScrollIndicator = false
        self.scrollView.isPagingEnabled = true
        
        self.addSubview(self.scrollView)
        self.scrollView.addSubview(self.contentView)
        
        // PageControlを作成する.
        self.pageControl.backgroundColor = .clear
        self.pageControl.pageIndicatorTintColor = AppColor.lineLightGray.withAlphaComponent(0.5)
        self.pageControl.currentPageIndicatorTintColor = .white
        self.pageControl.transform = CGAffineTransform(scaleX: 1.8, y: 1.8)
        
        // 現在ページを設定する.
        self.pageControl.currentPage = 0
        self.pageControl.isUserInteractionEnabled = false
        
        self.addSubview(self.pageControl)
        
        self.signupButton.set(title: "Sign Up", color: .green, font: .systemFont(ofSize: 20), cornerRadius: 0)
        self.addSubview(self.signupButton)
        
        self.loginButton.set(title: "Log In", color: .green, font: .systemFont(ofSize: 20), cornerRadius: 0)
        self.addSubview(self.loginButton)
        
        //レイアウト
        self.scrollView.snp.makeConstraints({ make in
            make.left.top.right.equalToSuperview()
            make.height.equalToSuperview().offset(-60)
        })
        
        self.contentView.snp.makeConstraints({ make in
            make.top.equalTo(self)
            make.bottom.equalTo(self).offset(-60)
            make.left.right.equalToSuperview()
        })
        
        self.pageControl.snp.makeConstraints { make in
            make.bottom.equalTo(self.scrollView.snp.bottom).offset(-30)
            make.left.right.equalToSuperview()
            make.height.equalTo(20)
        }
        self.signupButton.snp.makeConstraints{ make in
            make.bottom.left.equalToSuperview()
            make.top.equalTo(self.scrollView.snp.bottom)
            make.right.equalToSuperview().dividedBy(2)
        }
        self.loginButton.snp.makeConstraints{ make in
            make.bottom.right.equalToSuperview()
            make.top.equalTo(self.signupButton)
            make.left.equalTo(self.signupButton.snp.right)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(givenImageViews: [UIImageView]) {
        // テスト画像
        for givenImageView in givenImageViews{
            //            imageView.backgroundColor = .purple
            //            imageView.layer.borderWidth = 5
            givenImageView.contentMode = .scaleAspectFill
            givenImageView.clipsToBounds = true
            self.imageViews.append(givenImageView)
            self.contentView.addSubview(givenImageView)
        }
        
        for (i, imageView) in self.imageViews.enumerated() {
            switch i {
            case 0:
                imageView.snp.makeConstraints({ make in
                    make.top.bottom.equalToSuperview()
                    make.left.equalToSuperview().offset(imageViewMargin/2.0)
                    make.width.equalTo(self).offset(-imageViewMargin)
                    make.height.equalTo(imageView.snp.width).multipliedBy(472.0/375.0)
                })
            case 1..<self.imageViews.count - 1:
                imageView.snp.makeConstraints({ make in
                    make.top.bottom.width.equalTo(self.imageViews[0])
                    make.left.equalTo(self.imageViews[i-1].snp.right).offset(imageViewMargin)
                })
            case self.imageViews.count - 1:
                imageView.snp.makeConstraints({ make in
                    make.top.bottom.width.equalTo(self.imageViews[0])
                    make.left.equalTo(self.imageViews[i-1].snp.right).offset(imageViewMargin)
                    make.right.equalToSuperview().offset(-imageViewMargin/2.0)
                })
            default:
                assertionFailure()
            }
        }
        
        // PageControlするページ数を設定する.
        self.pageControl.numberOfPages = self.imageViews.count
        
        self.layoutIfNeeded()
    }
    
}

