//
//  HealthView.swift
//  HMLA
//
//  Created by Sunxiaolin on 17/1/23.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//

import UIKit

class HealthView: UIView {
    
    private lazy var functionTable: UITableView! = {
        var tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    private var dataArray = []
    
    internal var completionHandler: (NSIndexPath) -> () = {_ in 
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        self.addSubview(self.functionTable)
        self.functionTable.snp_makeConstraints { (make) -> Void in
            make.left.right.top.bottom.equalTo(self)
        }
    }
    
    internal func setDataArray(with data: NSArray){
        self.dataArray = data
        self.functionTable.reloadData()
    }

}

// MARK: - UITableViewDataSource
extension HealthView: UITableViewDataSource{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let identifer = "HealthTable"
        var cell = tableView.dequeueReusableCellWithIdentifier(identifer)
        if cell == nil{
            cell = UITableViewCell(style: .Default, reuseIdentifier: identifer)
        }
        cell?.textLabel?.font = UIFont.systemFontOfSize(18)
        cell?.textLabel?.text = self.dataArray[indexPath.row] as? String
        return cell!
    }
}

// MARK: - UITableViewDelegate
extension HealthView: UITableViewDelegate{
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.completionHandler(indexPath)
    }
}