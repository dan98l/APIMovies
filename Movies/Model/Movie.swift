//
//  Movie.swift
//  Movies
//
//  Created by Daniil G on 27.06.2020.
//  Copyright © 2020 Daniil G. All rights reserved.
//

import Foundation

struct MovieResponsive: Decodable {
    let results: [Movie]
}

struct Movie: Decodable {
    let poster_path: String?
    let id: Int?
    let title: String?
    let vote_average: Double?
    let overview: String?
    let release_date: String?
    let backdrop_path: String?
}

