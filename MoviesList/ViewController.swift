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
    
    var moviesViewModels = [MovieViewModel]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        MovieViewModel.getMovies { (movieJSON) in
            for movie in movieJSON.results {
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
        cell.posterImage.image = moviesViewModels[indexPath.row].image
        

        return cell
    }
    
}

