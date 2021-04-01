//
//  SceneDelegate.swift
//  RakutenTV
//
//  Created by JORDI GALLEN RENAU on 30/3/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }
        let viewController = HomeRouter().viewController
        let navConroller = UINavigationController(rootViewController: viewController)

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navConroller
        window?.makeKeyAndVisible()
        window?.windowScene = windowScene
    }
}
