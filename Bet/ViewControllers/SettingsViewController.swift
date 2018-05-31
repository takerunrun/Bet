//
//  SettingsViewController.swift
//  Bet
//
//  Created by admin on 2018/05/05.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit
import SnapKit

class SettingsViewController: UIViewController {
    
    let logoutView = LogoutView()
    
    let settingsTableView = UITableView()
    
    private let sectionTitles: [String] = ["アカウント設定", "その他"]
    
    // セルのタイトルと対応するViewControllerのペア
    private let accountRows: [(title: String, associatedVC: UIViewController)] = [
        (title: "プロフィール編集", associatedVC: ViewController()),
        (title: "メールアドレス変更", associatedVC: ViewController()),
        (title: "パスワード", associatedVC: ViewController())
    ]
    private let otherRows: [(title: String, associatedVC: UIViewController?)] = [
        (title: "アプリを評価する", associatedVC: ViewController()),
        (title: "このアプリについて", associatedVC: ViewController()),
        (title: "お問い合わせ", associatedVC: ViewController()),
        (title: "ログアウト", associatedVC: ViewController())
    ]
    
    private let accountSection = 0
    private let otherSection = 1
    private let cellID = "SettingsCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "各種設定"
        
        self.settingsTableView.delegate = self
        self.settingsTableView.dataSource = self
        self.settingsTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        
        setView()
        setFunc()
    }
    
    func setView() {
        self.view.backgroundColor = .white
        
        // ナビゲーションバー
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : AppColor.black]
        self.navigationController?.navigationBar.tintColor = AppColor.white
        self.navigationController?.navigationBar.barTintColor = .white
        let backButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backButtonItem
        
        let dismissButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(close))
        dismissButtonItem.tintColor = AppColor.lineGray
        self.navigationItem.leftBarButtonItem = dismissButtonItem
        
        self.settingsTableView.backgroundColor = AppColor.white
        self.settingsTableView.tableFooterView = UIView()
        self.view.addSubview(self.settingsTableView)
        
        // レイアウト
        self.settingsTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
    func setFunc(){
        self.logoutView.logoutButton.addTarget(self, action: #selector(self.logout), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // セルの選択を解除
        if let indexPathForSelectedRow = self.settingsTableView.indexPathForSelectedRow {
            self.settingsTableView.deselectRow(at: indexPathForSelectedRow, animated: true)
        }
    }
    
    @objc private func close() {
        dismiss(animated: true)
    }
    
    @objc private func logout(){
        let VC = UINavigationController(rootViewController: LoginViewController())
        self.present(VC, animated: true)
        //        let VC = FriendsViewController()
        //        self.navigationController?.pushViewController(VC, animated: true)
    }
    
}

extension SettingsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case self.accountSection:
            return self.accountRows.count
        case self.otherSection:
            return self.otherRows.count
        default:
            assertionFailure()
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellID, for: indexPath)
        
        switch indexPath.section {
        case self.accountSection:
            cell.textLabel?.text = self.accountRows[indexPath.row].title
        case self.otherSection:
            cell.textLabel?.text = self.otherRows[indexPath.row].title
        default:
            assertionFailure()
        }
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return self.logoutView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0{
            return 0
        } else {
            return 200
        }
    }
    
}

extension SettingsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pushingVC: UIViewController // 遷移先VC(遷移しない場合はreturnして抜ける)
        
        switch indexPath.section {
        case self.accountSection:
            pushingVC = self.accountRows[indexPath.row].associatedVC
        case self.otherSection:
            switch indexPath.row {
            case 0...7:
                pushingVC = self.otherRows[indexPath.row].associatedVC!
            default:
                assertionFailure()
                return
            }
        default:
            assertionFailure()
            return
        }
        
        // 画面遷移
        self.navigationController?.pushViewController(ViewController(), animated: true)
    }
}
