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
    
    var moviesViewModels = [MovieViewModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        NetworkService.shared.getMovies { (moviesJSON) in
            for movie in moviesJSON.results {
                self.moviesViewModels.append(MovieViewModel(movie: movie))
            }
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Cell
        cell.titleLabel.text = moviesViewModels[indexPath.row].title
        cell.descriptionLabel.text = String(moviesViewModels[indexPath.row].overview)
        //cell.posterImage.image = nil
        cell.posterImage.downloadedFrom(urlString: "https://image.tmdb.org/t/p/w500" + moviesViewModels[indexPath.row].poster_path!)

        return cell
    }
    
}


