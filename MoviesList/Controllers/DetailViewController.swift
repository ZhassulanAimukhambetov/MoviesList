//
//  DetailViewController.swift
//  MoviesList
//
//  Created by Zhassulan Aimukhambetov on 11/16/19.
//  Copyright © 2019 Zhassulan Aimukhambetov. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var movieVM: MovieViewModel?
    
    @IBOutlet weak var originalTitleLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = movieVM?.title
        NetworkService.shared.getImage(urlPath: movieVM?.backdrop_path) { (image) in
            self.posterImage.image = image
        }
        durationLabel.text = movieVM?.release_date
        overviewLabel.text = movieVM?.overview
        originalTitleLabel.text = movieVM?.original_title
    }
}

