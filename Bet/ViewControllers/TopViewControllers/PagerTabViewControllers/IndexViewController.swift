//
//  ClosetViewController.swift
//  fashion-pocket-ios
//
//  Created by 岩佐晃也 on 2018/02/28.
//  Copyright © 2018年 岩佐晃也. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import SnapKit

class IndexViewController: UIViewController,UICollectionViewDelegateFlowLayout,UINavigationControllerDelegate{
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
//    private let purchasedItemGroupView = ImageCollectionGroupView(numOfRow: 1) // 購入したアイテム
//    private let yourClosetGroupView = ImageCollectionGroupView(numOfRow: 1) // あなたのおてもちのアイテム
    private var purchasedItemImages: [UIImage] = []
    private var yourClosetImages: [UIImage] = []
    private var purchasedItemFavs: [Bool] = []
    private var yourClosetFavs: [Bool] = []
    private let purchasedItemTag = 1
    private let yourClosetTag = 2
    private let myCoordinateTag = 3
    private var picker: UIImagePickerController! = UIImagePickerController()
    private var camera = UIImage()
//    private let itemRegisterButton = DefaultButton()
    //あなたのアイテムのコーデ方法
    private let myCoordinateLabel = UILabel()
    private let myCoordinateSubTitleLabel = UILabel()
    private var myCoordinateImages: [UIImage] = []
    private var myCoordinateCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        for _ in 1...16{
//            self.purchasedItemImages.append(#imageLiteral(resourceName: "CoordinateSample"))
//        }
//        for _ in 1...16{
//            self.yourClosetImages.append(#imageLiteral(resourceName: "CoordinateSample"))
//        }
//        for _ in 1...30{
//            self.myCoordinateImages.append(#imageLiteral(resourceName: "CoordinateSample"))
//        }
        
        for _ in 0..<self.purchasedItemImages.count {
            self.purchasedItemFavs.append(false)
            self.yourClosetFavs.append(false)
        }
        
        setView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setView(){
        
        self.view.backgroundColor = .white
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.contentView)
        
        let grayLine = UIView()
        let grayLine2 = UIView()
        
//        self.purchasedItemGroupView.imageCollectionView.tag = self.purchasedItemTag
//        self.purchasedItemGroupView.titleLabel.text = "Purchased Item"
//        self.purchasedItemGroupView.subTitleLabel.text = "購入したアイテム"
//        self.purchasedItemGroupView.imageCollectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "cv1")
//        self.purchasedItemGroupView.imageCollectionView.delegate = self
//        self.purchasedItemGroupView.imageCollectionView.dataSource = self
//        self.contentView.addSubview(self.purchasedItemGroupView)
        
        grayLine.backgroundColor = UIColor.lightGray
        self.contentView.addSubview(grayLine)
        
//        self.yourClosetGroupView.imageCollectionView.tag = self.yourClosetTag
//        self.yourClosetGroupView.titleLabel.text = "Your Closet"
//        self.yourClosetGroupView.subTitleLabel.text = "あなたのお手持ちのアイテム"
//        self.yourClosetGroupView.cameraActionButton.isHidden = false
//        self.yourClosetGroupView.registerLabel.isHidden = false
//        self.yourClosetGroupView.cameraActionButton.addTarget(self, action: #selector(imagePickUp(sender:)), for: .touchUpInside)
//        self.yourClosetGroupView.imageCollectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "cv2")
//        self.yourClosetGroupView.imageCollectionView.delegate = self
//        self.yourClosetGroupView.imageCollectionView.dataSource = self
//        self.contentView.addSubview(self.yourClosetGroupView)
        
//        self.camera = #imageLiteral(resourceName: "camera")
//        self.itemRegisterButton.set(title: "　自分のアイテムを投稿する", color: .green, font: UIFont.hiragino(size: 14), cornerRadius: 5, image: camera)
//        self.itemRegisterButton.addTarget(self, action: #selector(imagePickUp), for:.touchUpInside);
//        self.contentView.addSubview(self.itemRegisterButton)
        
        grayLine2.backgroundColor = UIColor.lightGray
        self.contentView.addSubview(grayLine2)
        
        self.myCoordinateLabel.backgroundColor = UIColor.white
        self.myCoordinateLabel.baselineAdjustment = .alignCenters
        self.myCoordinateLabel.textAlignment = .center
        self.myCoordinateLabel.text = "Recommendation"
        self.myCoordinateLabel.textColor = AppColor.black
        self.myCoordinateLabel.font = UIFont.athelas(size: 20)
        self.contentView.addSubview(self.myCoordinateLabel)
        
        self.myCoordinateSubTitleLabel.baselineAdjustment = .alignCenters
        self.myCoordinateSubTitleLabel.textAlignment = .center
        self.myCoordinateSubTitleLabel.text = "あなたのアイテムのコーデ方法"
        self.myCoordinateSubTitleLabel.textColor = AppColor.textLightGray
        self.myCoordinateSubTitleLabel.font = UIFont.hiragino(size: 11)
        self.contentView.addSubview(self.myCoordinateSubTitleLabel)
        
        //collectionViewのLayout設定
        let Layout = UICollectionViewFlowLayout()
        Layout.scrollDirection = .vertical
        Layout.minimumInteritemSpacing = 12.0
        Layout.minimumLineSpacing = 12.0
        Layout.itemSize = CGSize(width:(self.view.frame.width-48)/3, height:136)
        self.myCoordinateCollectionView = UICollectionView(frame: .zero, collectionViewLayout: Layout);
        self.myCoordinateCollectionView.tag = self.myCoordinateTag
        self.myCoordinateCollectionView.backgroundColor = .white
        self.myCoordinateCollectionView.delegate = self
        self.myCoordinateCollectionView.dataSource = self
        self.myCoordinateCollectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "cv3")
        self.myCoordinateCollectionView.bounces = false
        self.contentView.addSubview(self.myCoordinateCollectionView)
        
        //パーツの場所指定していく
        self.scrollView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
        
        self.contentView.snp.makeConstraints({ make in
            make.top.bottom.equalToSuperview()
            make.left.right.equalTo(self.view)
        })
        
//        self.purchasedItemGroupView.snp.makeConstraints{ make in
//            make.top.equalToSuperview()
//            make.width.equalToSuperview()
//        }
        
        grayLine.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(1)
        }
        
//        self.yourClosetGroupView.snp.makeConstraints{ make in
//            make.top.equalTo(grayLine.snp.bottom)
//            make.width.equalToSuperview()
//        }
        
//        self.itemRegisterButton.snp.makeConstraints{ make in
//            //            make.centerY.equalToSuperview()
//            make.left.equalToSuperview().offset(16)
//            make.right.equalToSuperview().offset(-16)
//            make.height.equalTo(48)
//            make.top.equalTo(self.yourClosetGroupView.snp.bottom).offset(20)
//        }
        
        grayLine2.snp.makeConstraints{ make in
            make.top.equalTo(grayLine.snp.bottom).offset(20)
            make.width.equalToSuperview()
            make.height.equalTo(1)
        }
        
        self.myCoordinateLabel.snp.makeConstraints{ make in
            make.top.equalTo(grayLine2.snp.bottom).offset(10)
            make.width.equalToSuperview()
            make.height.equalTo(23)
            
        }
        
        self.myCoordinateSubTitleLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.myCoordinateLabel.snp.bottom)
            make.centerX.equalToSuperview()
            make.height.equalTo(11)
        }
        
        self.myCoordinateCollectionView.snp.makeConstraints{ make in
            make.top.equalTo(self.myCoordinateSubTitleLabel.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
            make.height.equalTo(790)
            make.bottom.equalTo(self.contentView)
        }
        
    }
    
//    @objc func onTappedFavoriteButton(_ sender: FavoriteButton) {
//
//        if let cell = sender.superview?.superview as? ImageCollectionViewCell {
//            if let indexPath = self.purchasedItemGroupView.imageCollectionView.indexPath(for: cell) {
//                self.purchasedItemFavs[indexPath.row] = sender.isSelected
//            } else if let indexPath = self.yourClosetGroupView.imageCollectionView.indexPath(for: cell) {
//                self.yourClosetFavs[indexPath.row] = sender.isSelected
//            }
//        }
//    }
}

extension IndexViewController: UICollectionViewDataSource {
    
    // 表示するアイテムの数を設定
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case self.purchasedItemTag:
            return self.purchasedItemImages.count
        case self.yourClosetTag:
            return self.yourClosetImages.count
        case self.myCoordinateTag:
            return self.myCoordinateImages.count
        default:
            assertionFailure()
            return 0
        }
    }
    // アイテムの表示
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cv\(collectionView.tag)", for: indexPath) as! ImageCollectionViewCell
        
        switch collectionView.tag {
        case self.purchasedItemTag:
            cell.thumbnailView.image = purchasedItemImages[indexPath.row]
//            cell.favoriteButton.isSelected = self.purchasedItemFavs[indexPath.row]
//            cell.favoriteButton.addTarget(self, action: #selector(self.onTappedFavoriteButton), for: .touchUpInside)
        case self.yourClosetTag:
            cell.thumbnailView.image = yourClosetImages[indexPath.row]
//            cell.favoriteButton.isSelected = self.yourClosetFavs[indexPath.row]
//            cell.favoriteButton.addTarget(self, action: #selector(self.onTappedFavoriteButton), for: .touchUpInside)
        case self.myCoordinateTag:
            cell.thumbnailView.image = self.myCoordinateImages[indexPath.row]
//            cell.setFavoriteButtonHidden(true)
        default:
            assertionFailure()
            return UICollectionViewCell()
        }
        
        return cell
    }
    
    
}

extension IndexViewController: UICollectionViewDelegate {
    
    //写真更新
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if self.myCoordinateCollectionView.contentOffset.y + self.myCoordinateCollectionView.frame.size.height + 60 > self.myCoordinateCollectionView.contentSize.height && self.myCoordinateCollectionView.isDragging {
            for _ in 1...6{
                self.myCoordinateImages.append(#imageLiteral(resourceName: "CoordinateSample"))
            }
            self.myCoordinateCollectionView.reloadData()
        }
    }
    // セルがタップされた時の処理
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch collectionView.tag {
//        case self.purchasedItemTag:
//            HomeViewController.shared.navigationController?.pushViewController(ItemDetailViewController(), animated: true)
//        case self.yourClosetTag:
//            HomeViewController.shared.navigationController?.pushViewController(MyItemDetailViewController(), animated: true)
        case self.myCoordinateTag:
            print(indexPath.row)
        default:
            assertionFailure()
        }
    }
    
    @objc func onTappedItem(_ sender: UITapGestureRecognizer) {
//        HomeViewController.shared.navigationController?.pushViewController(ItemDetailViewController(), animated: true)
    }
    
    @objc func onTappedItemDetailViewController(_ sender: UITapGestureRecognizer) {
//        HomeViewController.shared.navigationController?.pushViewController(MyItemDetailViewController(), animated: true)
    }
    
}

extension IndexViewController: UIImagePickerControllerDelegate {
    
    @objc func imagePickUp(sender: UIButton){
        let album = UIImagePickerControllerSourceType.photoLibrary
        if UIImagePickerController.isSourceTypeAvailable(album) {
            let album = UIImagePickerController()
            album.delegate = self
            album.sourceType = UIImagePickerControllerSourceType.photoLibrary
            album.allowsEditing = true
            self.present(album, animated: true, completion: nil)
        }
    }
    
}

extension IndexViewController: IndicatorInfoProvider {
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return "IndexViewController"
    }
}








