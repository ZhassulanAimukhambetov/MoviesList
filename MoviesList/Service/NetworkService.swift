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
    
    func getMovies(page: Int = 1, complition: @escaping (_ movies: MovieJSON) -> ()) {
        let pageString = String(page)
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a055f70548b7278f1f017fc33819dd5b&language=ru&page=" + pageString)
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
    func downloadedFrom(urlPath: String?) {
        if let urlPath = urlPath {
            let url = URL(string: "https://image.tmdb.org/t/p/w500" + urlPath)!
            let task = URLSession.shared.dataTask(with: url) { (data, responce, error) in
                guard let data = data else {
                    self.image = UIImage(named: "noimage")
                    return
                }
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                } else {
                    self.image = UIImage(named: "noimage")
                }
            }
            task.resume()
            
        } else {
            self.image = UIImage(named: "noimage")
        }
    }
}
