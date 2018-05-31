//
//  TopTabBarController.swift
//  Bet
//
//  Created by admin on 2018/04/29.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class TopTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var viewControllers: [UIViewController] = []
        
        let homeViewCtrl = UINavigationController(rootViewController: TimeLineViewController())
        homeViewCtrl.tabBarItem = UITabBarItem(title: "ホーム", image: #imageLiteral(resourceName: "home"), selectedImage: #imageLiteral(resourceName: "home_filled"))
        viewControllers.append(homeViewCtrl)
        
        let searchViewCtrl = UINavigationController(rootViewController: MenusViewController())
        searchViewCtrl.tabBarItem = UITabBarItem(title: "検索", image: #imageLiteral(resourceName: "plus"), selectedImage: #imageLiteral(resourceName: "plus"))
        viewControllers.append(searchViewCtrl)
        
        let favoriteViewCtrl = UINavigationController(rootViewController: ExploreViewController())
        favoriteViewCtrl.tabBarItem = UITabBarItem(title: "通知", image: #imageLiteral(resourceName: "bell"), selectedImage: #imageLiteral(resourceName: "bell_filled"))
        viewControllers.append(favoriteViewCtrl)
        
        let mypageViewCtrl = UINavigationController(rootViewController: ProfileViewController())
        mypageViewCtrl.tabBarItem = UITabBarItem(title: "友達", image: #imageLiteral(resourceName: "friend"), selectedImage: #imageLiteral(resourceName: "friend_filled"))
        viewControllers.append(mypageViewCtrl)
        
        self.setViewControllers(viewControllers, animated: false)
        
        //バーの色
        self.tabBar.barTintColor = .white
        //ボタンの文字サイズ
        UITabBarItem.appearance().setTitleTextAttributes([.font : UIFont.hiragino(size: 11)], for: UIControlState.normal)
        //選択されていないボタンの色
        self.tabBar.unselectedItemTintColor = AppColor.textGray
        //ボタンを押した時の色
        self.tabBar.tintColor = AppColor.green
        
        self.selectedIndex = 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
