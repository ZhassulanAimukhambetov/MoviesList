//
//  MoviesViewModel.swift
//  MoviesList
//
//  Created by Zhassulan Aimukhambetov on 11/14/19.
//  Copyright © 2019 Zhassulan Aimukhambetov. All rights reserved.
//

import Foundation
import UIKit

struct MovieViewModel {
    let id: Int
    let title: String
    let overview: String
    let poster_path: String?
    let release_date: String?
    let voteAverage: Double
    let backdrop_path: String?
    let original_title: String?
    let popularity: String?
    let originalLanguage: String
    var rating: String {
        return "Rating: \(String(self.voteAverage))"
    }
    
    init(movie: Movie) {
        self.id = movie.id
        self.title = movie.title.uppercased()
        self.overview = movie.overview
        self.poster_path = movie.poster_path
        self.release_date = "Release: \(movie.release_date ?? "")"
        self.voteAverage = movie.vote_average
        self.backdrop_path = movie.backdrop_path
        self.original_title = movie.original_title.uppercased()
        self.popularity = String(movie.popularity)
        self.originalLanguage = movie.original_language
    }
    
}


