//
//  AppDelegate.swift
//  VoiceMint
//
//  Created by test on 28/08/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Thread.sleep(forTimeInterval: 1.5)
        UIApplication.shared.isIdleTimerDisabled = true
        let fontAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "AvenirNext-Medium", size: 11)! ]
        UITabBarItem.appearance().setTitleTextAttributes(fontAttributes, for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes(fontAttributes, for: .selected)

        let appearance = UINavigationBarAppearance()
        appearance.largeTitleTextAttributes = [
            .font: UIFont(name: "AvenirNext-DemiBold", size: 34)!//,
           // .foregroundColor: UIColor.systemIndigo
        ]
        appearance.titleTextAttributes = [
            .font: UIFont(name: "AvenirNext-Medium", size: 22)!//,
            //.foregroundColor: UIColor.systemIndigo
        ]
        UINavigationBar.appearance().standardAppearance = appearance
       // UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }


}

