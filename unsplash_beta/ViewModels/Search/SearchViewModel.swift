//
//  SearchViewModel.swift
//  unsplash_beta
//
//  Created by Jordy De Jonghe on 05/10/2022.
//

import Foundation

class SearchViewModel{
    
    private let service: WebService
    
    public var onSearchResultsFinished: (() -> Void)?
    
    public private(set) var movies: [Movie] = []
    
    
    init(service: WebService = WebService.shared) {
        self.service = service
    }
    
    func searchMovies(title: String){
        service.searchMovies(title: title) { [weak self] result in
            switch result {
            case .success(let movies):
                self?.movies = movies ?? []
                self?.onSearchResultsFinished?()
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
}
