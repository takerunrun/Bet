//
//  TimeLineViewController.swift
//  Bet
//
//  Created by admin on 2018/05/08.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit
import SnapKit
import XLPagerTabStrip

class TimeLineViewController: UIViewController {
    
    
    let numberOfWorks = 10
    
    let workOutTableView = UITableView()
    private let cellID = "workOutCell"
    
    private let searchButton = UIButton()
    private let cartButton = UIButton()
    
    private let searchBarButtonItem = UIBarButtonItem()
    private let cartBarButtonItem = UIBarButtonItem()
    
    private let backButton = UIButton()
    private let backBarButtonItem = UIBarButtonItem()
    
    private var isEnabledBackButton = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.workOutTableView.delegate = self
        self.workOutTableView.dataSource = self
        self.workOutTableView.register(WorkOutCell.self, forCellReuseIdentifier: cellID)
        
        self.setView()
        self.setFunc()
    }
    
    func setView(){
        self.navigationController?.navigationBar.tintColor = AppColor.black
        self.navigationController?.navigationBar.barTintColor = AppColor.beige
        
        // UIViewにimageViewを追加しないとうまくサイズが反映されなかった
        let headerLogoImageView = UIImageView(image: #imageLiteral(resourceName: "home"))
        headerLogoImageView.contentMode = .scaleAspectFit
        let viewForHeaderLogo = UIView()
        headerLogoImageView.frame.size = CGSize(width: 150, height: 30)
        viewForHeaderLogo.addSubview(headerLogoImageView)
        viewForHeaderLogo.frame.size = CGSize(width: 150, height: 30)
        self.navigationItem.titleView = viewForHeaderLogo
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        self.searchButton.setImage(#imageLiteral(resourceName: "setting").withRenderingMode(.alwaysTemplate), for: .normal)
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
        
        
        self.workOutTableView.backgroundColor = AppColor.beige
        self.view.addSubview(self.workOutTableView)
        self.workOutTableView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
        
        
        
    }
    
    func setFunc() {
        self.searchButton.addTarget(self, action: #selector(self.onTappedSetting), for: .touchUpInside)
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
    
    @objc func onTappedSetting(_ sender: UIButton){
        let VC = UINavigationController(rootViewController: SettingsViewController())
        self.present(VC, animated: true)
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
    
    @objc private func trans2following(){
        let VC = UINavigationController(rootViewController: FriendsViewController())
        self.present(VC, animated: true)
        //        let VC = FriendsViewController()
        //        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    @objc private func trans2follower(){
        //        let VC = UINavigationController(rootViewController: FriendsViewController())
        //        self.present(VC, animated: true)
        let VC = FriendsViewController()
        self.navigationController?.pushViewController(VC, animated: true)
    }
}

extension TimeLineViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        } else {
            return numberOfWorks
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellID, for: indexPath) as! WorkOutCell
        cell.set(name: "AKIHIRO KOKUBO")
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    
}

extension TimeLineViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vct = ViewController()
        self.navigationController?.pushViewController(vct, animated: true)
    }
    
    
}

extension TimeLineViewController: IndicatorInfoProvider {
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return "タイムライン"
    }
}


