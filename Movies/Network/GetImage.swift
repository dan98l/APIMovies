//
//  GetImage.swift
//  Movies
//
//  Created by Daniil G on 30.06.2020.
//  Copyright © 2020 Daniil G. All rights reserved.
//

import Foundation

final class GetImage {
    class func getImageDataFrom(urlString: String, completion: @escaping (Result<Data, Error>) -> ()){
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in

        guard let data = data else {
            print("Empty Data")
            return
        }

        completion(.success(data))
        
        }.resume()
    }
}
