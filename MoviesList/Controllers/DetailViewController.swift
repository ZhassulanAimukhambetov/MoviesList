//
//  DetailViewController.swift
//  MoviesList
//
//  Created by Zhassulan Aimukhambetov on 11/16/19.
//  Copyright © 2019 Zhassulan Aimukhambetov. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    
    var movieVM: MovieViewModel?
    
    @IBOutlet weak var originalTitleLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = movieVM?.title
        NetworkService.shared.getImage(urlPath: movieVM?.backdrop_path) { (image) in
            self.posterImage.image = image
        }
<<<<<<< HEAD
        languageLabel.text = movieVM?.original_language
        overviewLabel.text = movieVM?.overview
        titleLabel.text = movieVM?.original_title
        popularityLabel.text = movieVM?.popularity
        
        
    }
    
    


=======
        languageLabel.text = movieVM?.originalLanguage
        overviewLabel.text = movieVM?.overview
        originalTitleLabel.text = movieVM?.original_title
        popularityLabel.text = movieVM?.popularity
        
    }
>>>>>>> 76374393f3fb848d19c1458b70471193c073e148
}

