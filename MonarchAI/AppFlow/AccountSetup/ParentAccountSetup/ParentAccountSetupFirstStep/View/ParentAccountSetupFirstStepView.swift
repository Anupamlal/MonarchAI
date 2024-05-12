//
//  ParentAccountSetupFirstStepView.swift
//  MonarchAI
//
//  Created by Anupam Lal on 12/05/24.
//

import SwiftUI

struct ParentAccountSetupFirstStepView: View {
    var body: some View {
        MAINavigationStack(
            sourceView:
                VStack {
                    VStack(spacing: 60) {
                        Image("monarch_ai_splash")
                            .padding(.top, 60)
                        
                        ParentAccountSetupStepView()
                    }
                    
                    Spacer()
                    
                    MAINavigationButton(buttonTitle: "Set up the child’s phone", backgroundEnable: true, destination: ParentAccountSetupFinalStepView())
                        .padding(.all, 30)
                        .padding(.bottom, 60)
                },
            navigationTitle: ""
        )
    }
}

struct ParentAccountSetupStepView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text("Download Monarch AI to kid’s device")
                .font(.boldFont(ofSize: 16))
                
            
            HStack(spacing: 20) {
                Image("check_icon")
                Text("Monarch is installed on the parent’s phone")
                    .font(.regularFont(ofSize: 14))
            }
                 
            
            HStack(spacing: 20) {
                Image("uncheck_icon")
                Text("Let’s set up your child’s phone")
                    .font(.regularFont(ofSize: 14))
            }
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
    ParentAccountSetupFirstStepView()
}
