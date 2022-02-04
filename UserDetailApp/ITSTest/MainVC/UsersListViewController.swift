//
//  UsersListViewController.swift
//  ITSTest
//
//  Created by Максим on 15.01.22.
//

import UIKit

class UsersListViewController: UIViewController {
    
    // MARK: - Private properties
    
    private var allUsers: [User] = []
    
    private var filteredUsers: [User] = [] {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.usersListView.reloadTableView()
            }
        }
    }
    
    private let maleSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["All", "Male", "Female"])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    private let usersListView = UsersListView()
    
    private var filterButtons: [UIButton] = []
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = usersListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarItems()
        setupView()
        loadData()
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        usersListView.setDelegate(delegate: self)
        usersListView.setDataSource(dataSource: self)
    }
    
    private func setupNavigationBarItems() {
        navigationItem.titleView = maleSegmentedControl
        maleSegmentedControl.addTarget(self, action: #selector(indexChanged), for: .valueChanged)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(didTapRefreshButton))
        
        navigationItem.leftBarButtonItems = [UIBarButtonItem.leftBarButton(self, action: #selector(sortAtoZ), imageName: "arrow.down"), UIBarButtonItem.leftBarButton(self, action: #selector(sortZtoA), imageName: "arrow.up")]
    }
    
    @objc private func sortAtoZ() {
        filteredUsers = filteredUsers.sorted { $0.age < $1.age }
    }
    
    @objc private func sortZtoA() {
        filteredUsers = filteredUsers.sorted { $0.age > $1.age }
    }
    
    @objc private func indexChanged(control: UISegmentedControl) {
        switch control.selectedSegmentIndex {
        case 0:
            filteredUsers = allUsers
        case 1:
            filteredUsers = allUsers.filter { $0.gender == "male" }
        case 2:
            filteredUsers = allUsers.filter { $0.gender == "female" }
        default:
            return
        }
    }
    
    private func loadData() {
        allUsers = NetworkService.parseJSON()
        filteredUsers = allUsers
    }
    
    // MARK: - Actions
    
    @objc func didTapRefreshButton() {
        maleSegmentedControl.selectedSegmentIndex = 0
        loadData()
    }
    
    private func showInfo(for user: User) {
        let infoVC = UserInfoViewController(user: user)
        self.navigationController?.pushViewController(infoVC, animated: true)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension UsersListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UsersListTableViewCell.reuseId, for: indexPath) as? UsersListTableViewCell else { return UITableViewCell() }
        cell.setup(with: filteredUsers[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showInfo(for: filteredUsers[indexPath.row])
    }
}
