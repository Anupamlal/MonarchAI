//
//  ParentSignUp.swift
//  MonarchAI
//
//  Created by Anupam Lal on 11/05/24.
//

import SwiftUI

struct ParentSignUp: View {
    
    @State var emailTextField: String = ""
    @State var passwordTextField: String = ""
    @State var confirmPasswordTextField: String = ""
    @State var showProgressView: Bool = false
    @EnvironmentObject private var appRootManager: AppRootManager
    @FocusState var focusState:FocusStateOnBoarding?
    
    var body: some View {
        
        MAINavigationStack(
            sourceView:
                VStack {
                    
                    HStack {
                        Text("Enter your information below or continue with social media account")
                        Spacer()
                    }
                    .frame(height: 40)
                    .font(.regularFont(ofSize: 16))
                    .padding(.top, 60)
                    .padding(.horizontal, 30)
                    
                    
                    MAITextField(textFieldBinding: $emailTextField, placeholder: "Email", keyboardType: .emailAddress)
                        .padding(.horizontal, 30)
                        .padding(.top, 20)
                        .focused($focusState, equals: .email)
                        .onTapGesture {
                            focusState = .email
                        }
                    
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
                        .focused($focusState, equals: .password)
                        .onTapGesture {
                            focusState = .password
                        }
                    
                    SecureField("Confirm Password", text: $confirmPasswordTextField)
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
                        .focused($focusState, equals: .confirmPassword)
                        .onTapGesture {
                            focusState = .confirmPassword
                        }
                    
                    MAIButton(buttonTitle: "Get started", backgroundEnable: true) {
                        proceedWithLogin()
                    }
                    .padding(.horizontal, 28)
                    .padding(.top, 30)
                    
                    HStack {
                        Rectangle()
                            .frame(width: 112, height: 2)
                            .foregroundStyle(Color.separatorLineColor())
                        
                        Text("or Register with")
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
                    
                    HStack(spacing: 4) {
                        Text("Already have an account?")
                            .font(.boldFont(ofSize: 16))
                        
                        NavigationLink {
                            ParentLoginView()
                        } label: {
                            Text("Log in")
                                .font(.boldFont(ofSize: 16))
                                .foregroundColor(.appThemeColor())
                        }
                    }
                    .padding(.bottom, 30)
                    
                }, 
            navigationTitle: "Sign up"
            
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
            appRootManager.currentRoot = .accountSetup
        }
    }
}

#Preview {
    ParentSignUp()
}
