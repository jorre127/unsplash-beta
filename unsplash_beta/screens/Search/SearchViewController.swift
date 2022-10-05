//
//  SearchViewController.swift
//  unsplash_beta
//
//  Created by Jordy De Jonghe on 05/10/2022.
//

import UIKit
import Stella

class SearchViewcontroller: UIViewController{
    let rowHeight: CGFloat = 112;
    
    private let searchViewModel = SearchViewModel()
    
    @IBOutlet weak var tableView: UITableView! {
        didSet{
            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(class: ListItem.self)
        }
    }
    
    var searchController: UISearchController {
        let controller = UISearchController()
        controller.searchBar.delegate = self
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        navigationItem.searchController = searchController
        
        searchViewModel.onSearchResultsFinished = onSearchResultsFinished
    }
    
    func onSearchResultsFinished() { tableView.reloadData() }
}

extension SearchViewcontroller: UISearchBarDelegate{
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return }
        searchViewModel.searchMovies(title: searchTerm)
    }
}

extension SearchViewcontroller: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return searchViewModel.movies.count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let listItem = tableView.dequeueReusableCell(forIndexPath: indexPath) as ListItem
        let currentMovie = searchViewModel.movies[indexPath.row]
        listItem.movie = currentMovie
        return listItem
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { return rowHeight }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentMovie = searchViewModel.movies[indexPath.row]
        let viewController = UIStoryboard(name: screens.detail.rawValue, bundle: nil).instantiateInitialViewController() as! DetailViewController
        viewController.detailViewModel.movie = currentMovie
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
