//
//  TitleModel.swift
//  Viaplay-assignment
//
//  Created by Jonas Bergström on 2022-11-11.
//

import SwiftUI

struct ViaplayResponse: Codable, Hashable {
    let _links: ViaplayLinks
}
// To access the "_links"

struct ViaplayLinks: Codable, Hashable {
    let viaplaySections: [Section]
    
    enum CodingKeys: String, CodingKey {
        case viaplaySections = "viaplay:sections"
    }
}
// To access the "viaplay:sections"

struct Section: Codable, Hashable {
    let title: String
}
// To access the "title"
