//
//  BillersTableViewHandler.swift
//  CBALoop
//
//  Created by Artur Friesen on 20.12.17.
//  Copyright © 2017 Commercial Bank of Africa. All rights reserved.
//

import UIKit

class LaunchInfoTableViewHandler: NSObject, UITableViewDelegate, UITableViewDataSource {
   
    var infos : [LaunchInfo]?

    var didSelectInfo: ((LaunchInfo)->())?

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.rowHeight = UITableView.automaticDimension
               tableView.estimatedRowHeight = 600

        return infos?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let launchInfoCell = tableView.dequeueReusableCell(withIdentifier: "LaunchInfoCell") as! LaunchInfoCell
        guard let info = infos?[indexPath.row] else {
            return launchInfoCell
        }
       

        
        launchInfoCell.titleLable.text = info.name
        launchInfoCell.descLabel.text = info.desc
        
        return launchInfoCell
    }
    
   
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let info = infos?[indexPath.row] else { return }
        didSelectInfo?(info)
    }
    
    
}
