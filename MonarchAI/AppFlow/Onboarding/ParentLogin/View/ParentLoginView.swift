//
//  ParentLoginView.swift
//  MonarchAI
//
//  Created by Anupam Lal on 11/05/24.
//

import SwiftUI

struct ParentLoginView: View {
        
    @State var emailTextField: String = ""
    @State var passwordTextField: String = ""
    @State var showProgressView: Bool = false
    @EnvironmentObject private var appRootManager: AppRootManager
    
    var body: some View {
        
        MAINavigationStack(
            sourceView:
                VStack {
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Welcome back!")
                            .font(.regularFont(ofSize: 20))
                        
                        HStack {
                            Text("Please login to continue")
                            Spacer()
                        }
                        .font(.regularFont(ofSize: 16))
                    }
                    .padding(.top, 60)
                    .padding(.horizontal, 30)
                    
                    MAITextField(textFieldBinding: $emailTextField, placeholder: "Email")
                        .padding(.horizontal, 30)
                        .padding(.top, 20)
                    
                    SecureField("Password", text: $passwordTextField)
                        .tint(.appThemeColor())
                        .padding()
                        .frame(height: 56)
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(lineWidth: 1.0)
                                .foregroundStyle(Color.strokeColor())
                        }
                        .padding(.horizontal, 30)
                        .padding(.top, 20)
                    
                    MAIButton(buttonTitle: "Get started", backgroundEnable: true) {
                        proceedWithLogin()
                    }
                    .padding(.horizontal, 28)
                    .padding(.top, 30)
                    
                    HStack {
                        Rectangle()
                            .frame(width: 112, height: 2)
                            .foregroundStyle(Color.separatorLineColor())
                        
                        Text("or login with")
                            .font(.regularFont(ofSize: 14))
                        
                        Rectangle()
                            .frame(width: 112, height: 2)
                            .foregroundStyle(Color.separatorLineColor())
                    }
                    .padding(.top, 40)
                    
                    HStack(spacing: 30) {
                        MAISocialLoginButton(buttonTitle: "Facebook", buttonIcon: "fb_icon") {
                            
                        }
                        
                        
                        MAISocialLoginButton(buttonTitle: "Google", buttonIcon: "google_icon") {
                            
                        }
                    }
                    .padding(.top, 40)
                    .padding(.horizontal, 28)
                    
                    Spacer()
                    
                }, navigationTitle: "Log in"
            
        )
        .overlay(content: {
            if self.showProgressView {
                Rectangle()
                    .foregroundStyle(Color.white.opacity(0.5))
                    .overlay {
                        ProgressView()
                            .controlSize(.large)
                            .tint(.black)
                    }
            }
            
        })
    }
    
    func proceedWithLogin() {
        self.showProgressView = true
        
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { timer in
            self.showProgressView = false
            appRootManager.currentRoot = .home
        }
    }
}

#Preview {
    ParentLoginView()
}
