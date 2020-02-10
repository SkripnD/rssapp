//
//  AppDelegate.swift
//  RssViewer
//
//  Created by Denis on 31/01/2020.
//  Copyright ©  2020 DS. All rights reserved.
//

import UIKit

import Swinject

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    // MARK: - DI Assembly
    lazy var container: Container = {
        let container = Container()
        
        // MARK: DAO Services
        container.register(IRssSourceDAOService.self) {
            _ in RssSourceDAOService() }
        .inObjectScope(.container)
        
        
        // MARK: Modules
        container.register(Assembly.self, name: AssemblyName.rssEmptySources.rawValue) { [unowned self] _ in
            RssEmptySourcesAssembly(resolver: self.resolver)
        }
        .inObjectScope(.container)
        
        container.register(Assembly.self, name: AssemblyName.rssAddSource.rawValue) { [unowned self] _ in
            RssSourceAddAssembly(resolver: self.resolver)
        }
        .inObjectScope(.container)
        
        
        return container
    }()
    
    lazy var resolver: DIResolver = {
        AppResolver(container: self.container)
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if #available(iOS 13.0, *) {
            // In iOS 13 setup is done in SceneDelegate
        } else {
            window?.makeKeyAndVisible()
        }

        return true
    }
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        if #available(iOS 13.0, *) {
            // In iOS 13 setup is done in SceneDelegate
        } else {
            window = UIWindow(frame: UIScreen.main.bounds)
            
            let router = StartRouter(resolver: self.resolver)
            // swiftlint:disable:next force_unwrapping
            router.start(window: window!)
        }
        
        return true
    }
    
    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

}

