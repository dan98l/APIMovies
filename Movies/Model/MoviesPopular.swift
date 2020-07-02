//
//  MoviesPopular.swift
//  Movies
//
//  Created by Daniil G on 28.06.2020.
//  Copyright © 2020 Daniil G. All rights reserved.
//

import Foundation

class MoviesPopular {
    
    private var popularMovies = [Movie]()
    
    private let popularMoviesURL = "https://api.themoviedb.org/3/movie/popular?api_key=afb20793e1a7d571016fad7cdd7d6075&language=en-US&page=1"
    
    func fetchPopularMovies(completion: @escaping (() -> ())) {
        APIService.getMoviesData(urlString: popularMoviesURL) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let moviesList):
                    self?.popularMovies = moviesList.results
                    completion()
                case .failure(let error):
                    print("Error json: \(error)")
                }
            }
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        if popularMovies.count != 0 {
            return popularMovies.count
        }
        return 0
    }
    
    func cellForRowAt (indexPath: IndexPath) -> Movie {
        return popularMovies[indexPath.row]
    }
    
}
