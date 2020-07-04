//
//  MoviesSearchController.swift
//  Movies
//
//  Created by Daniil G on 29.06.2020.
//  Copyright © 2020 Daniil G. All rights reserved.
//

import UIKit



final class MoviesSearchController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var table: UITableView!
    @IBOutlet private weak var searchMovies: UISearchBar!

    private var viewMovies = MoviesSearch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        table.delegate = self
        table.dataSource = self
    }
    
    // MARK: - IBActions
    @IBAction func searchButton(_ sender: Any) {
        
        guard let searchText = searchMovies.text else { return }
        let urlString = "https://api.themoviedb.org/3/search/movie?api_key=afb20793e1a7d571016fad7cdd7d6075&query=\(searchText)&page=1"
        self.viewMovies.fetchSearchMovies(urlString: urlString.replacingOccurrences(of: " ", with: "%20")) { [weak self] in
            self?.table.reloadData()
        }
        
    }
}

// MARK: - TableView DataSource
extension MoviesSearchController: UITableViewDelegate, UITableViewDataSource {
    
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
        
        UIView.animate(withDuration: 1.0, animations: {
            cell.alpha = 1.0
            cell.layer.transform = CATransform3DIdentity
        })
    }
    
}
