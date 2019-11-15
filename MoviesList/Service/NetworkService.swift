//
//  NetworkService.swift
//  MoviesList
//
//  Created by Zhassulan Aimukhambetov on 11/15/19.
//  Copyright © 2019 Zhassulan Aimukhambetov. All rights reserved.
//

import Foundation
import UIKit

class NetworkService {
    
    public static let shared = NetworkService()
    
    func getMovies(complition: @escaping (_ movies: MovieJSON) -> ()) {
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
}

extension UIImageView {
    func downloadedFrom(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, responce, error) in
            guard let data = data else { return }
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                self.image = image
            }
        }
        task.resume()
    }
}
