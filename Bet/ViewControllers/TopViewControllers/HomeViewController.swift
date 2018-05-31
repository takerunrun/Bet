//
//  HomeViewController.swift
//  Bet
//
//  Created by admin on 2018/04/29.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import SnapKit

class HomeViewController: ButtonBarPagerTabStripViewController {
    
    static let shared = HomeViewController() // シングルトン
    
    private var viewCtrls: [UIViewController] = []
    
    private let searchButton = UIButton()
    private let cartButton = UIButton()
    
    private let searchBarButtonItem = UIBarButtonItem()
    private let cartBarButtonItem = UIBarButtonItem()
    
    private let backButton = UIButton()
    private let backBarButtonItem = UIBarButtonItem()
    
    private let newTrendsIndex = 0
    private let closetIndex = 1
    private let shoppingIndex = 2
    
    private var isEnabledBackButton = false
    
    override func viewDidLoad() {
        self.setButtonBarStyles()
        super.viewDidLoad()
        
        self.setView()
        self.setFunc()
    }
    
    // ページ切り替えのボタンのスタイルを設定
    private func setButtonBarStyles() {
        self.settings.style.buttonBarBackgroundColor = .white
        
        self.settings.style.buttonBarItemBackgroundColor = .white
        self.settings.style.buttonBarItemTitleColor = AppColor.black
        self.settings.style.buttonBarItemFont = UIFont.hiragino(size: 12)
        
        self.settings.style.selectedBarBackgroundColor = AppColor.black
        self.settings.style.selectedBarHeight = 2.0
        
        self.settings.style.buttonBarHeight = 40
        self.settings.style.buttonBarMinimumLineSpacing = 0
        
        
        self.changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) in
            // 選択されていないボタンのテキスト色
            oldCell?.label.textColor = AppColor.textGray
            // 選択されているボタンのテキスト色
            newCell?.label.textColor = AppColor.black
        }
    }
    
    func setView(){
        self.navigationController?.navigationBar.tintColor = AppColor.black
        self.navigationController?.navigationBar.barTintColor = .white
        
        // UIViewにimageViewを追加しないとうまくサイズが反映されなかった
        let headerLogoImageView = UIImageView(image: #imageLiteral(resourceName: "home"))
        headerLogoImageView.contentMode = .scaleAspectFit
        let viewForHeaderLogo = UIView()
        headerLogoImageView.frame.size = CGSize(width: 150, height: 30)
        viewForHeaderLogo.addSubview(headerLogoImageView)
        viewForHeaderLogo.frame.size = CGSize(width: 150, height: 30)
        self.navigationItem.titleView = viewForHeaderLogo
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        self.searchButton.setImage(#imageLiteral(resourceName: "home").withRenderingMode(.alwaysTemplate), for: .normal)
        self.searchBarButtonItem.customView = self.searchButton
        // iOS11からNavigationItemにオートレイアウトが適用されるようになったのでこの記述が必要
        if #available(iOS 11.0, *) {
            self.searchBarButtonItem.customView?.widthAnchor.constraint(equalToConstant: 25).isActive = true
            self.searchBarButtonItem.customView?.heightAnchor.constraint(equalToConstant: 20).isActive = true
        } else {
            self.searchBarButtonItem.customView?.frame.size = CGSize(width: 25, height: 20)
        }
        self.navigationItem.setLeftBarButton(self.searchBarButtonItem, animated: true)
        
        self.cartButton.setImage(#imageLiteral(resourceName: "home").withRenderingMode(.alwaysTemplate), for: .normal)
        self.cartBarButtonItem.customView = self.cartButton
        // iOS11からNavigationItemにオートレイアウトが適用されるようになったのでこの記述が必要
        if #available(iOS 11.0, *) {
            self.cartBarButtonItem.customView?.widthAnchor.constraint(equalToConstant: 20).isActive = true
            self.cartBarButtonItem.customView?.heightAnchor.constraint(equalToConstant: 20).isActive = true
        } else {
            self.cartBarButtonItem.customView?.frame.size = CGSize(width: 20, height: 20)
        }
        self.navigationItem.setRightBarButton(self.cartBarButtonItem, animated: true)
        
        self.backButton.setImage(#imageLiteral(resourceName: "home"), for: .normal)
//        self.backButton.addTarget(self, action: #selector(self.onTappedBackButton), for: .touchUpInside)
        self.backBarButtonItem.customView = self.backButton
        // iOS11からNavigationItemにオートレイアウトが適用されるようになったのでこの記述が必要
        if #available(iOS 11.0, *) {
            self.backBarButtonItem.customView?.widthAnchor.constraint(equalToConstant: 20).isActive = true
            self.backBarButtonItem.customView?.heightAnchor.constraint(equalToConstant: 20).isActive = true
        } else {
            self.backBarButtonItem.customView?.frame.size = CGSize(width: 20, height: 20)
        }
    }
    
    func setFunc() {
//        self.searchButton.addTarget(self, action: #selector(self.onTappedDrawer), for: .touchUpInside)
        self.cartButton.addTarget(self, action: #selector(self.onTappedGlass), for: .touchUpInside)
    }
    
    /*
    @objc func onTappedDrawer(_ sender: UIButton) {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.centerContainer.toggle(.left, animated: true, completion: nil)
    }
    */
    
    @objc func onTappedGlass(_ sender: UIButton) {
        self.navigationController?.pushViewController(ViewController(), animated: true)
    }
    
    /*
    @objc func onTappedBackButton(_ sender: UIButton) {
        switch self.currentIndex {
        case self.newTrendsIndex:
            if let navCtrl = self.viewCtrls[self.newTrendsIndex] as? TabNavigationController {
                navCtrl.popViewController(animated: true)
            }
        case self.closetIndex:
            if let navCtrl = self.viewCtrls[self.closetIndex] as? TabNavigationController {
                navCtrl.popViewController(animated: true)
            }
        case self.shoppingIndex:
            if let navCtrl = self.viewCtrls[self.shoppingIndex] as? TabNavigationController {
                navCtrl.popViewController(animated: true)
            }
        default:
            assertionFailure()
        }
    }
    */
    
    /*
    @objc func onTappedShareButton(_ sender: UIButton) {
        if let tabNavCtrl = self.tabBarController?.selectedViewController as? TabNavigationController {
            tabNavCtrl.pushViewController(ViewController(), animated: true)
        }
    }
    */
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        // buttonBarView・assetAddButtonの配置調整
        if #available(iOS 11, *) {
            self.buttonBarView.frame.origin.y = self.view.safeAreaInsets.top
        }
    }
    
    // ページ切り替えをできないようにする
    private func setPagingEnabled(_ enabled: Bool) {
        self.buttonBarView.isUserInteractionEnabled = enabled
        self.buttonBarView.alpha = enabled ? 1.0 : 0.5
        self.containerView.isScrollEnabled = enabled
    }
    
    func enableBackButton(_ bool: Bool) {
        
        guard self.isEnabledBackButton != bool else {
            return
        }
        
        self.isEnabledBackButton = bool
        
        // 一旦nilを入れないとうまく処理されない
        self.navigationItem.setLeftBarButton(nil, animated: false)
        self.navigationItem.setRightBarButton(nil, animated: false)
        
        if bool {
            self.navigationItem.setLeftBarButton(self.backBarButtonItem, animated: false)
            self.navigationItem.setRightBarButtonItems([self.cartBarButtonItem, self.searchBarButtonItem], animated: false)
        } else {
            self.navigationItem.setLeftBarButton(self.searchBarButtonItem, animated: false)
            self.navigationItem.setRightBarButton(self.cartBarButtonItem, animated: false)
        }
    }
    
    // MARK: - PagerTabStripDataSource -
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        guard self.viewCtrls.isEmpty else {
            assertionFailure( )
            return self.viewCtrls
        }
        
//        self.viewCtrls.append(TabNavigationController(rootViewController: NewTrendsViewController()))
//        self.viewCtrls.append(TabNavigationController(rootViewController: ClosetViewController()))
        self.viewCtrls.append(TabNavigationController(rootViewController: TimeLineViewController()))
        self.viewCtrls.append(TabNavigationController(rootViewController: ProfileViewController()))

        return self.viewCtrls
    }
    
    override func updateIndicator(for viewController: PagerTabStripViewController, fromIndex: Int, toIndex: Int, withProgressPercentage progressPercentage: CGFloat, indexWasChanged: Bool) {
        super.updateIndicator(for: viewController, fromIndex: fromIndex, toIndex: toIndex, withProgressPercentage: progressPercentage, indexWasChanged: indexWasChanged)
        if progressPercentage == 1.0 {
            if let navCtrl = self.viewCtrls[toIndex] as? TabNavigationController {
                let bool = (navCtrl.viewControllers.count != 1)
                self.enableBackButton(bool)
            }
        }
    }
}

