//
//  LoginViewController.swift
//  Bet
//
//  Created by admin on 2018/05/08.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    let loginView = ImageSwipeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        
        self.loginView.scrollView.delegate = self
        var imageViews: [UIImageView] = []
        for i in 0...4{
            let v = UIImageView()
            let url = "http://160.16.66.221/images/signin" + String(i+1) + ".jpg"
            v.kf.setImage(with: URL(string: url))
            imageViews.append(v)
        }
        self.loginView.set(givenImageViews: imageViews)
        
        setView()
        setFunc()
        print(self.loginView.scrollView.contentSize)
    }
    
    func setView(){
        self.view.backgroundColor = .white
        
        self.view.addSubview(self.loginView)

        self.loginView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
    
    func setFunc(){
        self.loginView.signupButton.addTarget(self, action: #selector(self.onTappedSignUpButton), for: .touchUpInside)
    }
    
    @objc func onTappedSignUpButton(){
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        print("tapped!!")
    }
    
    @objc func onTappedLogInButton(){
        
    }
}

extension LoginViewController: UIScrollViewDelegate{
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if fmod(self.loginView.scrollView.contentOffset.x, self.loginView.frame.width) == 0 {
            // ページの場所を切り替える.
            self.loginView.pageControl.currentPage = Int(self.loginView.scrollView.contentOffset.x / self.loginView.frame.width)
        }
    }
}
