//
//  NasaImage.swift
//  SpaceX
//
//  Created by Admin on 20/05/2020.
//  Copyright © 2020 Kogi. All rights reserved.
//


import Foundation


public class NasaImage: Decodable  {
    public let date: String
    public let explanation: String
    public let hdurl: String
    public let imageTitle: String
    public let url: String
    enum CodingKeys: String, CodingKey {
        case date = "date"
        case explanation = "explanation"
        case hdurl = "hdurl"
        case imageTitle = "title"
        case url = "url"

    }
}




