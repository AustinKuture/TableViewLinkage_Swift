//
//  AKTableLinkage.swift
//  AKLinkage
//
//  Created by 李亚坤 on 2017/3/27.
//  Copyright © 2017年 Kuture. All rights reserved.
//

import UIKit

//swift 中继承的协议中如果存在required协议则必须实现,不否则会报错
class AKTableLinkage: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    //fileprivate 代表文件内私有,private代表完全私有,
    fileprivate lazy var leftTableView: UITableView = {
        
       let leftTableView = UITableView()
        
        leftTableView.frame = CGRect(x: 0, y: 0, width: 90, height: SCREAN_HEIGHT)
        leftTableView.delegate = self;
        leftTableView.dataSource = self;
        leftTableView.backgroundColor = UIColor.clear
        leftTableView.rowHeight = 60
        leftTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        leftTableView.showsVerticalScrollIndicator = false
        leftTableView.register(AKTableCell.self, forCellReuseIdentifier: "AKLinkage")
        
        return leftTableView
    }()//使用懒加载时一定记得后面加上小括号()
    
    fileprivate lazy var rightTableView: UITableView = {
        
        let rightTableView = UITableView()
        rightTableView.frame = CGRect(x: 90, y: 64, width: SCREAN_WIDTH - 90, height: SCREAN_HEIGHT - 64)
        rightTableView.delegate = self
        rightTableView.dataSource = self
        rightTableView.rowHeight = 60
        rightTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        rightTableView.showsVerticalScrollIndicator = false
        rightTableView.register(AKRightTableCell.self, forCellReuseIdentifier: "RightCell")
        
        return rightTableView
    }()
    
    fileprivate let dataArary:Array? = ["上优谷","幻池","云来之颠","徐风照雪","西霞紫梦浩光","通天紫光","慧石流光","弥高云丹","极寒霞丹","血浸白玉","紫金乌木","寒光古剑","避水异石","避风玄化珍珠","炼火菩提子","一枝梨花压海棠"]
    
    fileprivate var isScrolUpOrDown = true //true 为UP,false为DOWN
    fileprivate var lastCurrenY:CGFloat = 0.0
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(leftTableView)
        self.view.addSubview(rightTableView)
        leftTableView.selectRow(at: IndexPath(row: 0,section: 0) , animated: true, scrollPosition: .top)
    }
}

extension AKTableLinkage {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if tableView == leftTableView{
            
            return 1
        }else{
            
            return dataArary!.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == leftTableView{
            
            return (dataArary?.count)!
        }else{
            
            return Int(arc4random_uniform(10) + 1)
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == leftTableView {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "AKLinkage", for: indexPath) as! AKTableCell
            cell.nameLabel.text = dataArary?[indexPath.row]
            
            return cell
        }else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "RightCell", for: indexPath) as? AKRightTableCell
            cell?.priceLabel.text = "¥" + "\(CGFloat(arc4random_uniform(5000) + 1) * 0.1)"
            cell?.nameLabel.text = dataArary?[Int(arc4random_uniform(15))]
            
            return cell!
        }
    }
    
    //组头文字
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
        if tableView == leftTableView{
            
            return nil
        }else{
            
            return dataArary?[section]
        }
    }
    
    //点击左侧定位到右侧
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if (tableView == leftTableView){
            
            leftTableView.scrollToRow(at: IndexPath.init(row: indexPath.row, section: 0), at: .top, animated: true)
            rightTableView.scrollToRow(at: IndexPath.init(row: 0, section: indexPath.row), at: .top, animated: true)
        }
    }
    
    //向上滑动逻辑
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        if (tableView == rightTableView) &&  isScrolUpOrDown && rightTableView.isDragging{
            
            selectedRow(index: section)
        }
    }

    //向下滑动逻辑
    func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
        
        if (tableView == rightTableView) && !isScrolUpOrDown && rightTableView.isDragging{
            
            selectedRow(index: section + 1)
        }
    }
    
    //选定当前左边Cell
    func selectedRow(index: Int){
        
        leftTableView.selectRow(at: IndexPath.init(row: index, section: 0) , animated: true, scrollPosition: .top)
    }
    
    //判断当前滑动方向
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let tableView = scrollView as! UITableView
        if (tableView == rightTableView){
            
            isScrolUpOrDown = lastCurrenY > scrollView.contentOffset.y
            lastCurrenY = scrollView.contentOffset.y
        }
    }
}



































