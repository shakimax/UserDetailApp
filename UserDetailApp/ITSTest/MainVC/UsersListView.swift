//
//  UsersListVie.swift
//  ITSTest
//
//  Created by Максим on 15.01.22.
//

import Foundation

import UIKit

class UsersListView: UIView {
    
    // MARK: - Private Properties
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UsersListTableViewCell.self, forCellReuseIdentifier: UsersListTableViewCell.reuseId)
        return tableView
    }()

    // MARK: - Internal methods

    func setDelegate(delegate: UITableViewDelegate) {
        tableView.delegate = delegate
    }
    
    func setDataSource(dataSource: UITableViewDataSource) {
        tableView.dataSource = dataSource
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }

    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        createSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
 
    private func createSubviews() {
       addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
