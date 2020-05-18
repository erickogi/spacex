//
//  LoopDateFormatters.swift
///  SpaceX
//
//  Created by Admin on 18/05/2020.
//  Copyright © 2020 Kogi. All rights reserved.
//

import Foundation

public enum SpaceXDate: String {
    case monthNameWithDate = "MMM dd"
    case formatted = "dd MMM yyyy"
    case dotFormatted = "dd.MM.yyyy"
    case compact = "yyyyMMdd"
    case api = "dd/MM/yyyy"
    case apiShortYear = "dd/MM/yy"
    case fullMonthAndYear = "MMMM yyyy"

    public var formatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = self.rawValue
        return formatter
    }
}
