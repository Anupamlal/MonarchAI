//
//  AppRootManager.swift
//  MonarchAI
//
//  Created by Anupam Lal on 12/05/24.
//

import Foundation

final class AppRootManager: ObservableObject {
    
    @Published var currentRoot: eAppRoots = .splash
    
    enum eAppRoots {
        case splash
        case authentication
        case accountSetup
        case home
    }
}
