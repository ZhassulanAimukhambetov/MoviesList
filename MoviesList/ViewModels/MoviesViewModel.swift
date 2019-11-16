//
//  MoviesViewModel.swift
//  MoviesList
//
//  Created by Zhassulan Aimukhambetov on 11/14/19.
//  Copyright © 2019 Zhassulan Aimukhambetov. All rights reserved.
//

import Foundation
import UIKit

class MovieViewModel {
    let id: Int
    let title: String
    let overview: String
    let poster_path: String?
    let release_date: String?
    let voteAverage: Double
    var rating: String {
        return "Rating: \(String(self.voteAverage))"
    }
    
    init(movie: Movie) {
        self.id = movie.id
        self.title = movie.title
        self.overview = movie.overview
        self.poster_path = movie.poster_path
        self.release_date = movie.release_date
        self.voteAverage = movie.vote_average
    }
    
}


