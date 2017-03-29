//
//  AKRightTableCell.swift
//  AKLinkage
//
//  Created by 李亚坤 on 2017/3/29.
//  Copyright © 2017年 Kuture. All rights reserved.
//

import UIKit

class AKRightTableCell: UITableViewCell {

    lazy var headImg: UIImageView = {
        
        let headImg = UIImageView()
        let ocImg = UIImage()
        
        headImg.image = ocImg.createImage(with: UIColor.init(CGFloat(arc4random_uniform(250)), CGFloat(arc4random_uniform(250)), CGFloat(arc4random_uniform(250)), 1) , rectSize: CGSize.init(width: 40, height: 40), cornerRadius: 5)
        
        headImg.frame = CGRect(x: 10, y: 10, width: 40, height: 40)
        
        return headImg
    }()
    
    lazy var nameLabel: UILabel = {
        
        let nameLabel = UILabel()
        
        nameLabel.frame = CGRect(x: 55, y: 10, width: 200, height: 20)
        nameLabel.textColor = UIColor(123, 123, 123, 1)
        nameLabel.font = UIFont.systemFont(ofSize: 12)
        nameLabel.textAlignment = NSTextAlignment.left
        
        return nameLabel
    }()
    
    lazy var priceLabel: UILabel = {
        
        let priceLabel = UILabel()
        
        priceLabel.frame = CGRect(x: 55, y: 40, width: 200, height: 10)
        priceLabel.textColor = UIColor.red
        priceLabel.font = UIFont.systemFont(ofSize: 12)
        priceLabel.textAlignment = NSTextAlignment.left
        
        return priceLabel
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        contentView.addSubview(headImg)
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

//        self.backgroundColor = selected ? UIColor.init(230, 230, 230, 0.7): UIColor.white
    }




























}
