//
//  TableViewController.swift
//  CBALoop
//
//  Created by Jarret Hardie on 11/10/2017.
//  Copyright © 2017 Commercial Bank of Africa. All rights reserved.
//

import UIKit

class TableViewController<Cell: UITableViewCell, Item: Equatable>: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    weak var tableView: UITableView?
    let cellDescriptor: TableCellDescriptor<Cell, Item>
    var items: [Item] {
        didSet {
            tableView?.reloadData()
        }
    }
    
    var didSelect: ((Item) -> Void)?
    
    init(tableView: UITableView, items: [Item], cellDescriptor: TableCellDescriptor<Cell, Item>, initialSelection: Item? = nil) {
        self.tableView = tableView
        self.cellDescriptor = cellDescriptor
        self.items = items
        super.init()
        
        tableView.register(cellDescriptor.nib, forCellReuseIdentifier: cellDescriptor.reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        if let selection = initialSelection, let index = self.items.firstIndex(of: selection) {
            let indexPath = IndexPath(row: index, section: 0)
            tableView.selectRow(at: indexPath, animated: false, scrollPosition: .top)
        }
    }
    
    
    
    // MARK: - TableView delegate and datasource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellDescriptor.reuseIdentifier, for: indexPath)
        cellDescriptor.configure(cell as! Cell, item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        
        didSelect?(item)
    }
}
