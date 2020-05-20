//
//  TableCellDescriptor.swift
//  CBALoop
//
//  Created by Jarret Hardie on 25/09/2017.
//  Copyright © 2017 Commercial Bank of Africa. All rights reserved.
//

import UIKit

struct TableCellDescriptor<Cell: UITableViewCell, Item> {
    let nib: UINib
    let reuseIdentifier: String
    let configure: (Cell, Item) -> ()
    
    init(reuseIdentifier: String, nib: UINib, configure: @escaping (Cell, Item) -> ()) {
        self.nib = nib
        self.reuseIdentifier = reuseIdentifier
        self.configure = configure
    }
    
    init(reuseIdentifier: String, nibName: String, configure: @escaping (Cell, Item) -> ()) {
        let nib = UINib(nibName: nibName, bundle: nil)
        self.init(reuseIdentifier: reuseIdentifier, nib: nib, configure: configure)
    }
}
