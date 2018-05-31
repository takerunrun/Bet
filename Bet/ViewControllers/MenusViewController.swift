//
//  MenusViewController.swift
//  Bet
//
//  Created by admin on 2018/05/08.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class MenusViewController: UIViewController, UICollectionViewDelegate {
    
    private let cellID = "menuCell"
    let words:[String] = ["bench press", "dead lift", "squat", "腕立て", "体幹", "腹筋"]
    let images:[String] = ["bench", "dead", "squat", "udetate", "taikan", "hukkin", "bench", "dead", "squat", "udetate", "taikan", "hukkin"]
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = AppColor.lineLightGray
        tableView.rowHeight = 55
        return tableView
    }()
    private var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         self.tableView.frame = self.view.bounds
         tableView.register(ExploreCell.self, forCellReuseIdentifier: cellID)
         tableView.dataSource = self
         tableView.delegate = self
         self.view.addSubview(tableView)
         */
        
        let layout = UICollectionViewFlowLayout()
        self.collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        self.collectionView.backgroundColor = .white
        let inset = UIEdgeInsetsMake(10.0, 10.0, 0.0, 10.0)
        self.collectionView.adaptBeautifulGrid(numberOfGridsPerRow: 3, gridLineSpace: 11.0, sectionInset: inset)
        layout.footerReferenceSize = CGSize(width: self.view.frame.width, height: 200)
        layout.itemSize.height = layout.itemSize.height + 50
        self.collectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.backgroundColor = AppColor.beige
        self.view.addSubview(self.collectionView)
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
    
    
    
    
    
}

// MARK: - UICollectionViewDataSource -
extension MenusViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: MenuCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! MenuCollectionViewCell
        cell.set(imageName: "\(images[indexPath.row])", text: "\(images[indexPath.row])")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        let detail = ViewController()
        //        self.navigationController?.pushViewController(detail, animated: true)
        
        let detail = TagViewController(tag: images[indexPath.row], imageName: images[indexPath.row])
        self.navigationController?.pushViewController(detail, animated: true)
    }
}


