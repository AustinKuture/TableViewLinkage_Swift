//
//  ViewController.swift
//  AKLinkage
//
//  Created by 李亚坤 on 2017/3/24.
//  Copyright © 2017年 Kuture. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Main Nav";
    }
    
    let dataArray = ["TableLinkage","CollecLinkage"]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = dataArray[indexPath.row]
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let tableLink = AKTableLinkage()
        let CollecLink = AKCollecLinkage()
        
        if indexPath.row == 0 {
            
            tableLink.title = "TableLink"
            self.navigationController?.pushViewController(tableLink, animated: true)
        }else{
            
            CollecLink.title = "CollecLink"
            self.navigationController?.pushViewController(CollecLink, animated: true);
        }
    }
    
    


    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}

