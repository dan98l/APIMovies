//
//  APIService.swift
//  Movies
//
//  Created by Daniil G on 28.06.2020.
//  Copyright © 2020 Daniil G. All rights reserved.
//

import Foundation

final class APIService {
    
    class func getMoviesData(urlString: String, completion: @escaping (Result<MovieResponsive, Error>) -> ()) {
            
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            if let error = error {
                completion(.failure(error))
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else { return }
            
            do {

                let jsonData = try JSONDecoder().decode(MovieResponsive.self, from: data)
                completion(.success(jsonData))

            } catch let error {
                completion(.failure(error))
            }
                
        }.resume()
        
        }
    
    }
