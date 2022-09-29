//
//  ViewModel.swift
//  unsplash_beta
//
//  Created by Hannes Van den Berghe on 29/09/2022.
//

import Foundation

protocol ViewModelDelegate: AnyObject {
    func reloadData()
}

class ViewModel {
    
    private let service: WebService
    
    weak var delegate: ViewModelDelegate?
    
    init(service: WebService = WebService.shared) {
        self.service = service
    }
    
    let collection: [[Collection]] = [
        [
            Collection(title: "Title 1", owner: "Hannes"),
            Collection(title: "Title 2", owner: "Jef"),
            Collection(title: "Title 3", owner: "Koen")
        ],
        [
            Collection(title: "Title 1", owner: "Hannes"),
            Collection(title: "Title 2", owner: "Jef")
        ]
    ]
    
    var numerOfSections: Int {
        return collection.count
    }
    
    func numberOfRows(in section: Int) -> Int {
        return collection[section].count
    }
    
    func item(at indexPath: IndexPath) -> Collection {
        return collection[indexPath.section][indexPath.row]
    }
    
    func loadData() {
        service.fetchRandom { [weak self] result in
            switch result {
            case .success(let id):
                print(id)
                self?.delegate?.reloadData()
            case .failure(let error):
                print("Error \(error.localizedDescription)")
            }
        }
    }
}
