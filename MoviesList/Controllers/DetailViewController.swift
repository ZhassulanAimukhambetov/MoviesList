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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = movieVM?.title
    }
    


}
