//
//  Detail2HealthViewController.swift
//  HMLA
//
//  Created by Sunxiaolin on 17/1/24.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//

import UIKit
import URLNavigator
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class Detail2HealthViewController: UIViewController {

    private lazy var detailHealthView: Detail2HealthView = {
        var aHealthView = Detail2HealthView()
        return aHealthView
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        var activity = UIActivityIndicatorView()
        activity.activityIndicatorViewStyle = .Gray
        return activity
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.detailHealthView)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: self.activityIndicator)
        
        onRequestClassify()
    }
    
    override func viewDidLayoutSubviews() {
        self.detailHealthView.snp_makeConstraints { (make) -> Void in
            make.left.right.top.bottom.equalTo(self.view)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func startAnimating(){
        self.activityIndicator.startAnimating()
    }
    
    private func stopAnimating(){
        self.activityIndicator.stopAnimating()
    }
    
    func onRequestClassify(){
    
        startAnimating()
        dispatch_async(dispatch_get_global_queue(0, 0)) { () -> Void in
            Alamofire.request(.GET, RequestClassify.path()).responseObject { (resp: HealthModelArray?, error: ErrorType?) -> Void in
                
                self.stopAnimating()
                guard let response = resp else{
                    print("error:\(error)")
                    return
                }
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.detailHealthView.setDataArray(with: response.tngou!)
                })
                print(resp?.tngou!.count)
            }
        }
        
    }
    
    

}

