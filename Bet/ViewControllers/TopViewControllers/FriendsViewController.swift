//
//  FriendsViewController.swift
//  Bet
//
//  Created by admin on 2018/04/29.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit
import SnapKit

class FriendsViewController: UIViewController{
    
    let numberOfFriends = 36
    let friendsTableView = UITableView()
    private let cellID = "friendsCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "友達 ( " + String(numberOfFriends) + " )"
        
        self.friendsTableView.delegate = self
        self.friendsTableView.dataSource = self
        self.friendsTableView.register(FriendsCell.self, forCellReuseIdentifier: cellID)
        
        set()
    }
    
    func set(){
        self.view.backgroundColor = AppColor.green
        
//        let backButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//        self.navigationItem.backBarButtonItem = backButtonItem
        
        let dismissButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(close))
        dismissButtonItem.tintColor = AppColor.lineGray
        self.navigationItem.leftBarButtonItem = dismissButtonItem

        
        self.view.addSubview(self.friendsTableView)
        self.friendsTableView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
    
    @objc private func close() {
//        let navCtrl = self.presentingViewController as? UINavigationController
//        if let addAssetVC = navCtrl?.viewControllers.last as? AddAssetViewController {
//            addAssetVC.isFirstCapturing = false
//        }
        
        dismiss(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // セルの選択を解除
        if let indexPathForSelectedRow = self.friendsTableView.indexPathForSelectedRow {
            self.friendsTableView.deselectRow(at: indexPathForSelectedRow, animated: true)
        }
    }
}

extension FriendsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfFriends
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellID, for: indexPath) as! FriendsCell
        cell.set()
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "友達"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
}

extension FriendsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vct = ViewController()
        self.navigationController?.pushViewController(vct, animated: true)
    }
}
