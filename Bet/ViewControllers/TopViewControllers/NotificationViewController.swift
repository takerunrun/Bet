//
//  NotificationViewController.swift
//  Bet
//
//  Created by admin on 2018/04/29.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit
import SnapKit

class NotificationViewController: UIViewController{
    
    let numberOfNotification = 36
    let notificationTableView = UITableView()
    private let cellID = "notificationCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.title = "通知 ( " + String(numberOfNotification) + " )"
        
        self.notificationTableView.delegate = self
        self.notificationTableView.dataSource = self
        self.notificationTableView.register(NotificationCell.self, forCellReuseIdentifier: cellID)
        
        set()
    }
    
    func set(){
        self.view.backgroundColor = AppColor.green
        
        self.view.addSubview(self.notificationTableView)
        self.notificationTableView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
}

extension NotificationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfNotification
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellID, for: indexPath) as! NotificationCell
        cell.set()
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "通知"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
}

extension NotificationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
