//
//  SceneDelegate.swift
//  VoiceMint
//
//  Created by test on 28/08/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let _ = (scene as? UIWindowScene) else { return }
        if Constants.USERDEFAULTS.object(forKey: "isMode") != nil {
            let mode = Constants.USERDEFAULTS.integer(forKey: "isMode")
            if mode == 1 {
                window?.overrideUserInterfaceStyle = .light
            } else if mode == 2 {
                window?.overrideUserInterfaceStyle = .dark
            } else {
                window?.overrideUserInterfaceStyle = .unspecified
            }
        } else {
            Constants.USERDEFAULTS.set(0, forKey: "isMode")
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
  
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
  
    }

    func sceneWillResignActive(_ scene: UIScene) {
       
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
 
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
   
    }


}

