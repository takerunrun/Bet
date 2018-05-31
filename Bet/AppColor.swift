//
//  AppColor.swift
//  Bet
//
//  Created by admin on 2018/04/29.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

/// アプリで使用するカラーのレギュレーション
struct AppColor {
    
    private init() {} // 初期化禁止
    
    /// #111111 (rgb  17  17  17)
    static let black         = #colorLiteral(red: 0.06666666667, green: 0.06666666667, blue: 0.06666666667, alpha: 1)
    
    /// #555555 (rgb  85  85  85)
    static let textDarkGray  = #colorLiteral(red: 0.3333333333, green: 0.3333333333, blue: 0.3333333333, alpha: 1)
    
    /// #888888 (rgb 136 136 136)
    static let textGray      = #colorLiteral(red: 0.5333333333, green: 0.5333333333, blue: 0.5333333333, alpha: 1)
    
    /// #999999 (rgb 153 153 153)
    static let textLightGray = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
    
    /// #CCCCCC (rgb 204 204 204)
    static let lineGray      = #colorLiteral(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
    
    /// #EEEEEE (rgb 238 238 238)
    static let lineLightGray = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
    
    /// #FFFFFF (rgb 255 255 255)
    static let white         = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    
    /// #028E92 (rgb   93 219 195)
    static let green         = #colorLiteral(red: 0.3647058824, green: 0.8588235294, blue: 0.7647058824, alpha: 1)
    
    static let beige         = #colorLiteral(red: 0.968627451, green: 0.9450980392, blue: 0.9176470588, alpha: 1)
    
    static let darkBeige     = #colorLiteral(red: 0.9294117647, green: 0.8745098039, blue: 0.6980392157, alpha: 1)
    
}

