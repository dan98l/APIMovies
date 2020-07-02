//
//  MoviesSearch.swift
//  Movies
//
//  Created by Daniil G on 29.06.2020.
//  Copyright © 2020 Daniil G. All rights reserved.
//

import Foundation

final class MoviesSearch {
    private var searchMovies = [Movie]()
    
    func fetchSearchMovies(urlString: String, completion: @escaping (() -> ())) {
        APIService.getMoviesData(urlString: urlString) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let moviesList):
                    self?.searchMovies = moviesList.results
                    completion()
                case .failure(let error):
                    print("Error json: \(error)")
                }
            }
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        if searchMovies.count != 0 {
            return searchMovies.count
        }
        return 0
    }
    
    func cellForRowAt (indexPath: IndexPath) -> Movie {
        return searchMovies[indexPath.row]
    }
    
}
