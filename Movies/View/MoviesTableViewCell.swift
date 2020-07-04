//
//  MoviesTableViewCell.swift
//  Movies
//
//  Created by Daniil G on 29.06.2020.
//  Copyright © 2020 Daniil G. All rights reserved.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var movieImageViewForBluer: UIImageView!
    @IBOutlet private weak var movieImageView: UIImageView!
    @IBOutlet private weak var movieTitle: UILabel!
    @IBOutlet private weak var movieAverage: UILabel!
    @IBOutlet private weak var movieOverview: UILabel!
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    
    var movie: Movie! {
        didSet {
            updateMovieUI()
        }
    }
    
    private var urlString: String = ""
        
    
    private func updateMovieUI() {
        
        self.activityIndicator.startAnimating()
        self.activityIndicator.isHidden = false
        self.movieImageView.image = nil
        
        guard let title = movie.title else { return }
        self.movieTitle.text = title
        
        guard let average = movie.vote_average else { return }
        self.movieAverage.text = String(average)
        
        guard let overview = movie.overview else { return }
        self.movieOverview.text = overview
        
        guard let posterString = movie.poster_path else { return }
        urlString = "https://image.tmdb.org/t/p/w500" + posterString

        MoviewImage.fetchImageMovies(urlString: urlString) { [weak self] data in
            if let image = UIImage(data: data) {
                self?.movieImageView.image = image
                self?.movieImageViewForBluer.image = image
                self?.activityIndicator.stopAnimating()
                self?.activityIndicator.isHidden = true
            }
        }
    }
    
}
