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
    var image: UIImage = UIImage(named: "noimage")!
    
    init(movie: Movie) {
        self.id = movie.id
        self.title = movie.title
        self.overview = movie.overview
        self.poster_path = movie.poster_path
        downloadImage()
    }
    
    func downloadImage() {
        if let poster_path = self.poster_path {
            let url = URL(string: "https://image.tmdb.org/t/p/w500" + poster_path)!
            let task = URLSession.shared.dataTask(with: url) { (data, responce, error) in
                guard let data = data else { return }
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }
            task.resume()
        }
    }
}


