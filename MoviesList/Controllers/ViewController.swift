//
//  ViewController.swift
//  MoviesList
//
//  Created by Zhassulan Aimukhambetov on 11/14/19.
//  Copyright © 2019 Zhassulan Aimukhambetov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var movieViewModels = [MovieViewModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        NetworkService.shared.getMovies { (moviesJSON) in
            for movie in moviesJSON.results {
                self.movieViewModels.append(MovieViewModel(movie: movie))
            }
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieCell
        cell.configureMovieCell(movieViewModel: movieViewModels[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastItem = movieViewModels.count - 1
        if indexPath.row == lastItem {
            NetworkService.shared.getMovies(page: movieViewModels.count/20 + 1) { (moviesJSON) in
                for movie in moviesJSON.results {
                    self.movieViewModels.append(MovieViewModel(movie: movie))
                }
                self.tableView.reloadData()
            }
        }
    }
    
}


