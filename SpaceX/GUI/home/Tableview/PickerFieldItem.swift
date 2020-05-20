//
//  PickerFieldItem.swift
//  CBALoop
//
//  Created by Jarret Hardie on 12/10/2017.
//  Copyright © 2017 Commercial Bank of Africa. All rights reserved.
//

import Foundation

struct PickerFieldItem<T: Comparable>: CustomStringConvertible, Comparable {
    
    let item: T
    let displayText: (T) -> String
    
    init(item: T, displayText: @escaping (T) -> String) {
        self.item = item
        self.displayText = displayText
    }
    
    var description: String {
        return displayText(item)
    }
}

func ==<T>(lhs: PickerFieldItem<T>, rhs: PickerFieldItem<T>) -> Bool {
    return lhs.item == rhs.item
}

func <<T>(lhs: PickerFieldItem<T>, rhs: PickerFieldItem<T>) -> Bool {
    return lhs.item < rhs.item
}
