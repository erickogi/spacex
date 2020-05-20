//
//  LaunchInfo.swift
//  SpaceX
//
//  Created by Admin on 20/05/2020.
//  Copyright © 2020 Kogi. All rights reserved.
//

import Foundation
public struct LaunchInfo : Comparable {
    public var name: String
    public var desc: String
    public var icon: String
    
    init(name : String,desc: String,icon: String) {
        self.name = name
        self.desc = desc
        self.icon = icon
    }

//    enum CodingKeys: String, CodingKey {
//        case desc
//        case name
//        case icon
//    }
//
    public static func == (lhs: LaunchInfo, rhs: LaunchInfo) -> Bool {
        return lhs.desc == rhs.desc && lhs.name == rhs.name
    }

    public static func < (lhs: LaunchInfo, rhs: LaunchInfo) -> Bool {
        return lhs.name < rhs.name
    }

}
