//
//  MoviewImage.swift
//  Movies
//
//  Created by Daniil G on 30.06.2020.
//  Copyright © 2020 Daniil G. All rights reserved.
//

import Foundation

final class MoviewImage {
    class func fetchImageMovies(urlString: String, completion: @escaping ((Data) -> ())) {
        GetImage.getImageDataFrom(urlString: urlString) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let moviesImage):
                    completion(moviesImage)
                case .failure(let error):
                    print("Error json: \(error)")
                }
            }
        }
    }
    
}
