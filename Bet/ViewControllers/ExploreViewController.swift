//
//  ExploreViewController.swift
//  Bet
//
//  Created by admin on 2018/05/05.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController, UICollectionViewDelegate, UISearchResultsUpdating {
    
    private let cellID = "exploreCell"
    let words:[String] = ["bench press", "dead lift", "squat", "腕立て", "体幹", "腹筋"]
    let images:[String] = ["bench", "dead", "squat", "udetate", "taikan", "hukkin", "bench", "dead", "squat", "udetate", "taikan", "hukkin"]
    var searchResults:[String] = []
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = AppColor.lineLightGray
        tableView.rowHeight = 55
        return tableView
    }()
    private var collectionView: UICollectionView!
    private let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "タグから検索"
        searchController.searchBar.tintColor = AppColor.green
        searchController.dimsBackgroundDuringPresentation = false
        return searchController
    }()
    
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
        let inset = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)
        self.collectionView.adaptBeautifulGrid(numberOfGridsPerRow: 2, gridLineSpace: 0.0, sectionInset: inset)
        layout.footerReferenceSize = CGSize(width: self.view.frame.width, height: 200)
        layout.itemSize.height = layout.itemSize.height + 0
        self.collectionView.register(ExploreCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.backgroundColor = AppColor.beige
        self.view.addSubview(self.collectionView)
        
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = true
        
        self.navigationItem.searchController = self.searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
    
    // 文字が入力される度に呼ばれる
    func updateSearchResults(for searchController: UISearchController) {
        self.searchResults = images.filter{
            // 大文字と小文字を区別せずに検索
            $0.lowercased().contains(searchController.searchBar.text!.lowercased())
        }
//        self.tableView.reloadData()
        self.collectionView.reloadData()
    }
    
    
    
}

// MARK: - UICollectionViewDataSource -
extension ExploreViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searchController.isActive {
            return searchResults.count
        } else {
            return images.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: ExploreCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! ExploreCollectionViewCell
        if searchController.isActive {
            cell.set(imageName: "\(searchResults[indexPath.row])", text: "\(searchResults[indexPath.row])")
        } else {
            cell.set(imageName: "\(images[indexPath.row])", text: "\(images[indexPath.row])")
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let detail = ViewController()
//        self.navigationController?.pushViewController(detail, animated: true)
        
        if searchController.isActive {
            self.searchController.isActive = false
            let detail = ViewController()
            self.navigationController?.pushViewController(detail, animated: true)
        } else {
            let detail = TagViewController(tag: images[indexPath.row], imageName: images[indexPath.row])
            self.navigationController?.pushViewController(detail, animated: true)
            
        }
    }
}




/*
// MARK: - UITableViewDataSource -
extension ExploreViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            return searchResults.count
        } else {
            return PPAP.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellID, for: indexPath as IndexPath) as! ExploreCell
        if searchController.isActive {
            cell.set(text: "\(searchResults[indexPath.row])")
        } else {
            cell.set(text: "\(PPAP[indexPath.row])")
        }
        
        return cell
    }
}

// MARK: - UITableViewDelegate -
extension ExploreViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
*/



