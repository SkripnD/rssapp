//
//  SceneDelegate.swift
//  RssViewer
//
//  Created by Denis on 31/01/2020.
//  Copyright © 2020 DS. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)

        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            let router = StartRouter(resolver: delegate.resolver)
            // swiftlint:disable:next force_unwrapping
            router.start(window: window!)
        }
    }
}

