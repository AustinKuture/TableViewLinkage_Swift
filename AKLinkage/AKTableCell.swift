//
//  AKTableCell.swift
//  AKLinkage
//
//  Created by 李亚坤 on 2017/3/29.
//  Copyright © 2017年 Kuture. All rights reserved.
//

import UIKit

class AKTableCell: UITableViewCell {
    
    lazy var nameLabel : UILabel = {
        
        var nameLabel = UILabel()
        
        nameLabel.frame = CGRect(x: 10, y: 5, width: 70, height: 50)
        nameLabel.font = UIFont.systemFont(ofSize: 15)
        nameLabel.numberOfLines = 0
        nameLabel.textAlignment = NSTextAlignment.left
        
        return nameLabel
    }()
    
    lazy var yellowView = UIView ()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configUI() {
        
        yellowView.frame = CGRect(x: 0, y: 5, width: 5, height: 50)
        yellowView.backgroundColor = UIColor(255, 211, 18, 1)
        
        nameLabel.textColor = UIColor.black
        nameLabel.highlightedTextColor = UIColor(255, 211, 18, 1)
        
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(yellowView)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        backgroundColor = selected ? UIColor.white : UIColor(229, 229, 229, 1)
        nameLabel.isHighlighted = selected
        yellowView.isHidden = !selected
        
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
