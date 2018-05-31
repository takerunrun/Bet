//
//  TagViewController.swift
//  Bet
//
//  Created by admin on 2018/05/05.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit
import SnapKit

class TagViewController: UIViewController {
    
    let numberOfWorks = 10
    
    private var tag: String!
    private var imageName: String!
    let workOutTableView = UITableView()
    private let cellID = "workOutCell"
    
    init(tag: String, imageName: String){
        self.tag = tag
        self.imageName = imageName
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.workOutTableView.delegate = self
        self.workOutTableView.dataSource = self
        self.workOutTableView.register(WorkOutCell.self, forCellReuseIdentifier: cellID)
        
        setView()
    }
    
    func setView(){
        
        self.view.addSubview(self.workOutTableView)
        self.workOutTableView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
        
        

    }
    
    
}

extension TagViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        } else {
            return numberOfWorks
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellID, for: indexPath) as! WorkOutCell
        cell.set(name: "akihiro")
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return self.view.layer.bounds.width
        } else {
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let tagView = TagView()
        tagView.set(tag: self.tag, imageName: self.imageName)
        return tagView
       
    }
    
    
}

extension TagViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vct = ViewController()
        self.navigationController?.pushViewController(vct, animated: true)
    }
    
    
}

