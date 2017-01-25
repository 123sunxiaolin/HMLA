//
//  Detail2HealthView.swift
//  HMLA
//
//  Created by Sunxiaolin on 17/1/25.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//

import UIKit

class Detail2HealthView: UIView {
    
    private lazy var detailTableView: UITableView = {
        var tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50
        return tableView
    }()
    
    private var dataArray = [HealthClassifyModel]()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        self.addSubview(self.detailTableView)
        self.detailTableView.snp_makeConstraints { (make) -> Void in
            make.left.right.top.bottom.equalTo(self)
        }
    }
    
    internal func setDataArray(with data: NSArray){
        self.dataArray = data as! [HealthClassifyModel]
        self.detailTableView.reloadData()
    }

}

// MARK: - UITableViewDataSource
extension Detail2HealthView: UITableViewDataSource{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifer = NSStringFromClass(DetailToHealthTableViewCell.self)
        var cell = tableView.dequeueReusableCellWithIdentifier(identifer) as? DetailToHealthTableViewCell
        if cell == nil{
            cell = DetailToHealthTableViewCell(style: .Default, reuseIdentifier: identifer)
        }
        let aModel = self.dataArray[indexPath.row]
        cell?.setHealthModel(aModel)
        return cell!
    }
}

extension Detail2HealthView: UITableViewDelegate{
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
}
