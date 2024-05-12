//
//  SplashView.swift
//  MonarchAI
//
//  Created by Anupam Lal on 10/05/24.
//

import SwiftUI

struct SplashView: View {
    
    @StateObject var splashViewModel = SplashViewModel()
    @EnvironmentObject private var appRootManager: AppRootManager
    
    var body: some View {
        
        ZStack {
            Image("monarch_ai_splash")
            
            if (splashViewModel.isApiHitGoingOn) {
                ProgressView()
                    .padding(.top, SCREEN_SIZE.height/3)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .onAppear(perform: {
            splashViewModel.isApiHitGoingOn = !splashViewModel.isApiHitGoingOn
            startTimerAndGoToDeviceOwnerView()
        })
                
    }
    
    func startTimerAndGoToDeviceOwnerView() {
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { timer in
            self.splashViewModel.isApiHitGoingOn = false
            self.appRootManager.currentRoot = .authentication
        }
    }
    
}

#Preview {
    SplashView()
}
