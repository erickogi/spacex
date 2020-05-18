//
//  LoopNumber.swift
///  SpaceX
//
//  Created by Admin on 18/05/2020.
//  Copyright © 2020 Kogi. All rights reserved.
//

import Foundation

public enum SpaceXNumber {
    case signPrefixedAmount
    case amount
    case amountNoFraction
    case amountWithFraction
    case amountWithSymbol
    case amountField
    case amountFieldWithFraction
    case rate

    public var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        switch self {
        case .signPrefixedAmount:
            formatter.numberStyle = .currency
            formatter.positivePrefix = "+ "
            formatter.negativePrefix = "- "
            formatter.currencyCode = "KES"
        case .amount:
            formatter.numberStyle = .currency
            formatter.currencySymbol = ""
        case .amountNoFraction:
            formatter.numberStyle = .currency
            formatter.currencySymbol = ""
            formatter.minimumFractionDigits = 0
            formatter.maximumFractionDigits = 0
        case .amountWithFraction:
            formatter.numberStyle = .currency
            formatter.currencySymbol = ""
            formatter.minimumFractionDigits = 2
            formatter.maximumFractionDigits = 2
        case .amountWithSymbol:
            formatter.numberStyle = .currency
            formatter.currencySymbol = "KES "
        case .amountField:
            formatter.numberStyle = .currency
            formatter.currencySymbol = "KES "
            formatter.minimumFractionDigits = 0
            formatter.maximumFractionDigits = 0
        case .amountFieldWithFraction:
            formatter.numberStyle = .currency
            formatter.currencySymbol = "KES "
            formatter.minimumFractionDigits = 2
            formatter.maximumFractionDigits = 2
        case .rate:
            formatter.numberStyle = .decimal
            formatter.minimumFractionDigits = 2
            formatter.maximumFractionDigits = 2
        }
        
        return formatter
    }
}
