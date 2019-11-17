//
//  MovieJSON.swift
//  MoviesList
//
//  Created by Zhassulan Aimukhambetov on 11/17/19.
//  Copyright © 2019 Zhassulan Aimukhambetov. All rights reserved.
//

import Foundation

struct MovieJSON: Decodable {
    let results: [Movie]
    let page: Int
    let total_pages: Int
    let total_results: Int
}
