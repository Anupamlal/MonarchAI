//
//  MonarchAIApp.swift
//  MonarchAI
//
//  Created by Anupam Lal on 10/05/24.
//

import SwiftUI

@main
struct MonarchAIApp: App {
    
    @StateObject private var appRootManager = AppRootManager()
    
    var body: some Scene {
        WindowGroup {
            
            Group {
                switch appRootManager.currentRoot {
                case .splash:
                    SplashView()
                    
                case .deviceOwnerTypeSelection:
                    DeviceOwnerView()
                    
                case .tutorialAndOnboarding(let deviceOwnerType):
                    TutorialView(deviceOwnerType: deviceOwnerType)
                    
                case .accountSetup:
                    ParentAccountSetupFirstStepView()
                    
                case .home:
                    HomeScreenView()                
                }
            }
            .environmentObject(appRootManager)
            
        }
    }
}
