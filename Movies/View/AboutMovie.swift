//
//  AboutMovie.swift
//  Movies
//
//  Created by Daniil G on 30.06.2020.
//  Copyright © 2020 Daniil G. All rights reserved.
//

import UIKit

final class AboutMovie: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieDate: UILabel!
    @IBOutlet weak var movieAverage: UILabel!
    @IBOutlet weak var movieOverview: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var clickButton: UIButton!
    
    // MARK: - Properties
    private var viewMovies = MoviesPopular()
    private var yuotubePath = YouTubePath()
    private var youTubePathString = ""
    
    var urlString: String = ""
    var movie: Movie!
    
    override func viewDidLoad() {
        updateMovieUI()
        getYoutubePath()
    }
    
    private func updateMovieUI() {
        
        self.clickButton.alpha = 0.0
        
        guard let title = movie.title else { return }
        self.movieTitle.text = title

        guard let release_date = movie.release_date else { return }
        self.movieDate.text = release_date

        guard let average = movie.vote_average else { return }
        self.movieAverage.text = String(average)
        
        guard let overview = movie.overview else { return }
        self.movieOverview.text = overview
        
        guard let backdropString = movie.backdrop_path else { return }
        urlString = "https://image.tmdb.org/t/p/w500" + backdropString
           
        MoviewImage.fetchImageMovies(urlString: urlString) { [weak self] data in
            if let image = UIImage(data: data) {
                self?.movieImageView.image = image
            }
        }
    }
    
    private func getYoutubePath() {
        yuotubePath.fetchYouTubePath(id: movie.id!) { [weak self] in
            self?.youTubePathString = "https://www.youtube.com/watch?v=\(self!.yuotubePath.fetchPathVidoe())"
            self?.animaredButtonAndImage()
        }
    }
    
    private func animaredButtonAndImage() {
        UIView.animate(withDuration: 0.5, delay: 1, options: .curveEaseInOut, animations: {
        self.clickButton.alpha = 1.0
        }) { _ in print("Animation Done") }
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showYoutube" else { return }
        guard let destination = segue.destination as? YouTubeView else { return }
        destination.urlString = youTubePathString
    }

}
