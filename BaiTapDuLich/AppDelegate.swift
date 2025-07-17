//
//  AppDelegate.swift
//  BaiTapDuLich
//
//  Created by Admin on 3/7/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setUpTabBar()
        setUpNavBar()
        return true
    }
    func setUpNavBar(){
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .clear
        UINavigationBar.appearance().tintColor = .neutral2
        appearance.titleTextAttributes = [
            .font: UIFont.boldSystemFont(ofSize: 20),
            .foregroundColor: UIColor.neutral1
        ]
        let backImage = UIImage.icLeft2
        appearance.setBackIndicatorImage(backImage, transitionMaskImage: backImage)
        let backButtonAppearance = UIBarButtonItemAppearance()
        backButtonAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor.clear
        ]
        appearance.backButtonAppearance = backButtonAppearance
        appearance.shadowColor = .clear
        
////        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -1000,vertical: 0), for: .default)
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        //        ßappearance.setBackIndicatorImage(/**/, transitionMaskImage: T##UIImage?)
    }
    func setUpTabBar(){
        let apperance = UITabBarAppearance()
        apperance.configureWithOpaqueBackground()
        apperance.backgroundColor = .neutral5
        // Override point for customization after application launch.
//        let attributedString = NSAttributedString()
        let normalAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.neutral4,
            .font: UIFont.systemFont(ofSize: 14)
        ]
        let selectedAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.primary,
            .font: UIFont.systemFont(ofSize: 14)
        ]
        apperance.stackedLayoutAppearance.normal.titleTextAttributes = normalAttributes
        apperance.stackedLayoutAppearance.selected
            .titleTextAttributes = selectedAttributes
        UITabBar.appearance().standardAppearance = apperance
        UITabBar.appearance().scrollEdgeAppearance = apperance
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

