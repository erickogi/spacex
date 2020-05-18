//
//  ViewController.swift
//  SpaceX
//
//  Created by Admin on 18/05/2020.
//  Copyright © 2020 Kogi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    let myArray = ["row 1", "row 2", "row 3", "row 4"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return  myArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        }
        if self.myArray.count > 0 {
            cell?.textLabel!.text = self.myArray[indexPath.row]
        }
        cell?.textLabel?.numberOfLines = 0

        return cell!
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }


}

