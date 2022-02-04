//
//  UsersListTableViewCell.swift
//  ITSTest
//
//  Created by Максим on 15.01.22.
//

import UIKit

class UsersListTableViewCell: UITableViewCell {
    
    private struct Size {
        
    }
    
    // MARK: - Private properties
    
    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    private let ageLabel: UILabel = {
        let ageLabel = UILabel()
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        return ageLabel
    }()
    
    private let genderLabel: UILabel = {
        let genderLabel = UILabel()
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        return genderLabel
    }()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal methods
    
    func setup(with user: User) {
        nameLabel.text = user.name
        ageLabel.text = "\(user.age)"
        genderLabel.text = user.gender
    }
    
    // MARK: - Private methods
    
    private func createSubviews() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(ageLabel)
        contentView.addSubview(genderLabel)

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            ageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            ageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            ageLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            genderLabel.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 8),
            genderLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            genderLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            genderLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}
