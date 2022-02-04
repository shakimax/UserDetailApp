//
//  SceneDelegate.swift
//  ITSTest
//
//  Created by Максим on 15.01.22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
       
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        
        let navigationController = UINavigationController(rootViewController: UsersListViewController())
        window?.rootViewController = navigationController
    }
}

