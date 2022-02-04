//
//  UserInfoViewController.swift
//  ITSTest
//
//  Created by Максим on 18.01.22.
//

import UIKit
import MapKit

class UserInfoViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private let userInfoView = UserInfoView()
    
    private var userInfo: User
    
    // MARK: - Initialization
    
    init(user: User) {
        self.userInfo = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = userInfoView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Private Methods

    private func setupView() {
        navigationItem.title = userInfo.name
        userInfoView.setupUserInfo(name: userInfo.name, about: userInfo.about)
        userInfoView.setupMap(latitude: userInfo.latitude,
                              longitude: userInfo.longitude,
                              name: userInfo.name,
                              address: userInfo.address)
        
    }
}
