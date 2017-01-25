//
//  DetailToHealthTableViewCell.swift
//  HMLA
//
//  Created by Sunxiaolin on 17/1/25.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//

import UIKit

class DetailToHealthTableViewCell: UITableViewCell {

    private lazy var titleLabel: UILabel = {
        return UILabel.label(
            with: CGRectZero,
            backgroundColor: UIColor.clearColor(),
            font: UIFont.systemFontOfSize(18),
            textAlignment: .Left,
            textColor: UIColor.blackColor())
    }()
    
    private lazy var descriptionLabel: UILabel = {
        var label = UILabel.label(
            with: CGRectZero,
            backgroundColor: UIColor.clearColor(),
            font: UIFont.systemFontOfSize(14),
            textAlignment: .Left,
            textColor: UIColor.Color_666())
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var keywordBtn:UIButton = {
        var btn = UIButton(type: UIButtonType.Custom)
        btn.imageEdgeInsets = UIEdgeInsetsMake(5, 0, -5, -20)
        btn.titleEdgeInsets = UIEdgeInsetsMake(5, 20, -5, 0)
        btn.setImage(UIImage(named: "hotSearch"), forState: .Normal)
        btn.backgroundColor = UIColor.orangeColor()
        return btn
    }()
    
    private lazy var keywordsImageView: UIImageView = {
        var imageView = UIImageView(image: UIImage(named: "hotSearch"))
        imageView.backgroundColor = UIColor.clearColor()
        return imageView
    }()
    
    private let leftPadding = 20.0
    private let rightPadding = 20.0
    private let topPadding = 10.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        contentView.addSubview(self.titleLabel)
        self.titleLabel.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(contentView).offset(leftPadding)
            make.top.equalTo(contentView).offset(topPadding)
            make.right.equalTo(contentView).offset(-100)
        }
        
        contentView.addSubview(self.keywordsImageView)
        self.keywordsImageView.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(contentView).offset(-rightPadding)
            make.top.equalTo(self.titleLabel)
            make.size.equalTo(CGSizeMake(60.0, 60.0))
        }
        
        contentView.addSubview(self.descriptionLabel)
        self.descriptionLabel.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(contentView).offset(leftPadding)
            make.top.equalTo(self.titleLabel.snp_bottom).offset(topPadding)
            make.right.equalTo(contentView).offset(-rightPadding)
        }
        
        contentView.snp_makeConstraints { (make) -> Void in
            make.bottom.equalTo(self.descriptionLabel.snp_bottom)
            make.leading.trailing.top.equalTo(self)
        }
    }
    
    func setHealthModel(model: HealthClassifyModel){
        self.titleLabel.text = model.title
        self.descriptionLabel.text = model.description
    }

}
