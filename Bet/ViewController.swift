//
//  ViewController.swift
//  Bet
//
//  Created by admin on 2018/04/29.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "工事中"
        self.view.backgroundColor = .white
        
        set()
    }
    
    func set(){
        let view = UnderConstructionView()
        self.view.addSubview(view)
        
        view.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

