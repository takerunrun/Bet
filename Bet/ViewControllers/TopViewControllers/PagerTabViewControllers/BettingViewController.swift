//
//  BettingViewController.swift
//  Bet
//
//  Created by admin on 2018/04/29.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import SnapKit

class BettingViewController: UIViewController {
    
    private var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = AppColor.green
        tableView.register(BettingViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        self.tableView.snp.makeConstraints({ (make) -> Void in
            make.edges.equalToSuperview()
        })
        
    }
}

// MARK: - UITableViewDataSource -
extension BettingViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BettingViewCell
        cell.set("yuniba", date: "あs；どふぃhs；lkfjs；えflhw；lぎs", price: "2018年3月35日")
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
}

// MARK: - UITableViewDelegate -
extension BettingViewController: UITableViewDelegate {
    
    //cellをタップした時のアクション
    func tableView(_ table: UITableView,didSelectRowAt indexPath: IndexPath) {
        
//        let detail = DetailViewController(image: UIImage(named: imageNames[indexPath.row])!, title: imageTitles[indexPath.row], sub: subtitles[indexPath.row])
//        self.navigationController?.pushViewController(detail, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    
}

extension BettingViewController: IndicatorInfoProvider {
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return "BettingViewController"
    }
}



