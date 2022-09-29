//
//  CollectionViewController.swift
//  unsplash
//
//  Created by Hannes Van den Berghe on 29/09/2022.
//

import UIKit
import Stella

////
/// {
/// "title_collection_blub": "Test",
/// "owner": "Test"
/// }
///
///

struct Collection: Codable {
    var title: String
    var owner: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title_collection_blub"
        case owner
    }
}

class CollectionViewController: UIViewController {
    
    private let viewModel = ViewModel()
    
    @IBOutlet weak var collectionsTableView: UITableView! {
        didSet {
            collectionsTableView.dataSource = self
            collectionsTableView.delegate = self
            collectionsTableView.sectionHeaderHeight = 50
            collectionsTableView.register(class: CollectionCell.self)
            collectionsTableView.estimatedRowHeight = 120
            collectionsTableView.rowHeight = 120
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadData()
    }
}

// MARK: - UITableViewDataSource

extension CollectionViewController: UITableViewDataSource, UITableViewDelegate, CollectionCellDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        print(section)
        let view = UIView()
        view.backgroundColor = UIColor.red
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 8).isActive = true
        label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        label.text = "Section \(section)"
        return view
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numerOfSections
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as CollectionCell
        cell.collection = viewModel.item(at: indexPath)
        cell.delegate = self
        cell.selectSwithHandler = { [weak self] value in
            print(value)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = viewModel.item(at: indexPath)
        print("Item is \(item)")
    }
    
    func didToggleSwitch(with value: Bool, for cell: CollectionCell) {
        let indexPath = collectionsTableView.indexPath(for: cell)!
        let item = viewModel.item(at: indexPath)
        print(item)
    }
}
