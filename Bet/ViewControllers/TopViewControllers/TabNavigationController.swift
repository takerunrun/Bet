//
//  TabNavigationController.swift
//  Bet
//
//  Created by admin on 2018/04/29.
//  Copyright © 2018年 admin. All rights reserved.
//

import XLPagerTabStrip

// タブ内での画面遷移のために作成
class TabNavigationController: UINavigationController, IndicatorInfoProvider {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: - IndicatorInfoProvider -
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        if let firstViewCtrl = self.viewControllers.first as? IndicatorInfoProvider {
            return firstViewCtrl.indicatorInfo(for: pagerTabStripController)
        } else {
//            assertionFailure()
            return "error"
        }
    }
}

