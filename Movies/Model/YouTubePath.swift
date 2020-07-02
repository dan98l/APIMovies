//
//  YouTubePath.swift
//  Movies
//
//  Created by Daniil G on 01.07.2020.
//  Copyright © 2020 Daniil G. All rights reserved.
//

import Foundation

final class YouTubePath {
    
    private var trailerData = [Trailer]()
    
    func fetchYouTubePath(id: Int, completion: @escaping (() -> ())) {
        YouTube.getYouTubePath(id: id) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let youTubePath):
                    self.trailerData = youTubePath.results
                    completion()
                case .failure(let error):
                    print("Error json: \(error)")
                }
            }
        }
    }
    
    func fetchPathVidoe() -> String {
        return trailerData[0].key!
    }
    
}
