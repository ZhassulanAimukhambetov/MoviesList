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
    var image: UIImage? = nil
    
    init(movie: Movie) {
        self.id = movie.id
        self.title = movie.title
        self.overview = movie.overview
        self.poster_path = movie.poster_path!
        self.getImage { (image) in
            self.image = image
        }
    }
    
    static func getMovies(complition: @escaping (_ movies: MovieJSON) -> ()) {
        //let keyAPI = "a055f70548b7278f1f017fc33819dd5b"
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a055f70548b7278f1f017fc33819dd5b&language=ru")
        let task = URLSession.shared.dataTask(with: url!) { (data, responce, error) in
            guard let data = data else { return }
            let moviesJSON = try! JSONDecoder().decode(MovieJSON.self, from: data)
            DispatchQueue.main.async {
                complition(moviesJSON)
            }
        }
        task.resume()
    }
    
    func getImage(complition: @escaping (UIImage?)->()) {
        let url = URL(string: "https://image.tmdb.org/t/p/w500" + self.poster_path!)
        let task = URLSession.shared.dataTask(with: url!) { (data, responce, error) in
            guard let data = data else { return }
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                complition(image)
            }
        }
        task.resume()
    }
}
