//
//  ParentAccountSetupFinalStepView.swift
//  MonarchAI
//
//  Created by Anupam Lal on 12/05/24.
//

import SwiftUI

struct ParentAccountSetupFinalStepView: View {
    
    @State var otpTextToShow: String = "6555"
    
    var body: some View {
        MAINavigationStack(
            sourceView:
                VStack {
                    FinalStepView(otpText: $otpTextToShow)
                        .padding(.top, 60)
                    
                    Spacer()
                    
                    MAINavigationButton(buttonTitle: "Done", backgroundEnable: true, destination: AddChildView())
                        .padding(.all, 30)
                        .padding(.bottom, 60)
                },
            navigationTitle: "Steps"
        )
    }
}

struct FinalStepView: View {
    
    @Binding var otpText: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            
            Text("Follow the steps below :-")
                .font(.semiBoldFont(ofSize: 16))
                .frame(maxWidth: .infinity)
            
            HStack(spacing: 20) {
                Text("1.")
                Text("Take your child phone")
                    .font(.regularFont(ofSize: 14))
            }.padding(.horizontal)
            
            
            HStack(spacing: 20) {
                Text("2.")
                Text("Download The Monarch AI")
                    .font(.regularFont(ofSize: 14))
            }.padding(.horizontal)
            
            HStack(spacing: 20) {
                Text("3.")
                Text("Open the Monarch AI and select child phone and then enter this ")
                    .font(.regularFont(ofSize: 14)) +
                Text("code -")
                    .font(.semiBoldFont(ofSize: 14))
            }.padding(.horizontal)
            
            HStack(alignment: .center) {
                Text(otpText)
                    .font(.boldFont(ofSize: 24))
                    .padding(.all, 25)
                    .padding(.horizontal, 30)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundStyle(Color.white)
                    )
            }
            .frame(maxWidth: .infinity)
            
        }
        .padding()
        .padding(.vertical, 10)
        .frame(width: SCREEN_SIZE.width - 56)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(Color.kidsColor())
        )
    }
}

#Preview {
    ParentAccountSetupFinalStepView()
}
