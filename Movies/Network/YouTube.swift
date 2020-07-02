//
//  YouTube.swift
//  Movies
//
//  Created by Daniil G on 01.07.2020.
//  Copyright © 2020 Daniil G. All rights reserved.
//

import Foundation

final class YouTube {
    
    class func getYouTubePath(id: Int, completion: @escaping (Result<TrailerResponsive, Error>) -> ()) {
            
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)/videos?api_key=afb20793e1a7d571016fad7cdd7d6075&language=en-US") else {return}
        print(url)
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            if let error = error {
                completion(.failure(error))
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            guard let data = data else { return }
            
            do {

                let jsonData = try JSONDecoder().decode(TrailerResponsive.self, from: data)
                completion(.success(jsonData))

            } catch let error {
                completion(.failure(error))
            }
                
        }.resume()
        
        }
    }
