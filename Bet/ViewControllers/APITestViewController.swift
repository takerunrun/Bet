//
//  APITestViewController.swift
//  Bet
//
//  Created by admin on 2018/05/07.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit
import Alamofire
import SnapKit
import Kingfisher

class APITestViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        let v = UIImageView(frame: CGRect(x: 10, y: 10, width: 100, height: 100))
        v.kf.setImage(with: URL(string: "https://cdn-ak.f.st-hatena.com/images/fotolife/l/llcc/20151012/20151012161841.png"))
        view.addSubview(v)
        
        let button = DefaultButton()
        button.set(title: "ここを押してね！！", color: .green, font: .hiraginoBold(size: 30), cornerRadius: 5)
        self.view.addSubview(button)
        
        button.snp.makeConstraints{ make in
            make.centerX.centerY.equalToSuperview()
        }
        
        button.addTarget(self, action: #selector(self.getWeather), for: .touchUpInside)
    }
    
    @objc func getWeather(_ sender: UIButton) {
        // 天気情報APIにアクセスする
        Alamofire.request("http://weather.livedoor.com/forecast/webservice/json/v1?city=130010").responseJSON {response in
            print("Request: \(String(describing: response.request))")
            print("Response: \(String(describing: response.response))")
            print("Result: \(String(describing: response.result))")
            
            if let json = response.result.value {
                print("JSON: \(json)")  // serialized json response
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)")  // original server data as UTF8 String
            }
        }
    }
}
