//
//  HealthViewController.swift
//  HMLA
//
//  Created by Sunxiaolin on 17/1/23.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//

import UIKit
import SnapKit

class HealthViewController: UIViewController {
    
    private let dataArray = [
        "健康资讯",
        "健康知识",
        "健康问答",
        "健康图书"
    ]
    
    private lazy var healthView: HealthView! = {
        var healthView = HealthView()
        return healthView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.BackColor()
        healthView.backgroundColor = UIColor.BackColor()
        self.view.addSubview(self.healthView)
        healthView.setDataArray(with: dataArray)
        healthView.completionHandler = { (index: NSIndexPath)  in
            print(index.row)
            
        }
    }
    
    override func viewDidLayoutSubviews() {
        self.healthView.snp_makeConstraints { (make) -> Void in
            make.left.right.top.bottom.equalTo(self.view)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}




