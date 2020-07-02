//
//  Trailer.swift
//  Movies
//
//  Created by Daniil G on 01.07.2020.
//  Copyright © 2020 Daniil G. All rights reserved.
//

import Foundation

struct TrailerResponsive: Decodable {
    let results: [Trailer]
}

struct Trailer: Decodable {
    let key: String?
    let site: String?
}
