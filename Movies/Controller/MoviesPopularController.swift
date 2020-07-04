//
//  MoviesPopularController.swift
//  Movies
//
//  Created by Daniil G on 28.06.2020.
//  Copyright © 2020 Daniil G. All rights reserved.
//

import UIKit

final class MoviesPopularController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var table: UITableView!
    
    // MARK: - Properties
    private var viewMovies = MoviesPopular()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
      
    private func setupTableView() {
        viewMovies.fetchPopularMovies() { [weak self] in
            self?.table.delegate = self
            self?.table.dataSource = self
            self?.table.reloadData()
        }
    }
    
}

// MARK: - TableView DataSource
extension MoviesPopularController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewMovies.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MoviesTableViewCell
        let movie = viewMovies.cellForRowAt(indexPath: indexPath)
        cell.movie = movie
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = (storyboard?.instantiateViewController(withIdentifier: "AboutMovie") as? AboutMovie)!
        let movie = viewMovies.cellForRowAt(indexPath: indexPath)
        vc.movie = movie
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -50, 10, 0)
        cell.layer.transform = rotationTransform
        cell.alpha = 0.7
        
        UIView.animate(withDuration: 0.5, animations: {
            cell.alpha = 1.0
            cell.layer.transform = CATransform3DIdentity
        })
    }
    
}
