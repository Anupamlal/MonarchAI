//
//  MAISocialLoginButton.swift
//  MonarchAI
//
//  Created by Anupam Lal on 12/05/24.
//

import SwiftUI

struct MAISocialLoginButton: View {
    var buttonTitle: String
    var buttonIcon: String
    var buttonAction:(()->())
    
    var body: some View {
        
        
        Button(action: {
            buttonAction()
            
        }, label: {
            
            RoundedRectangle(cornerRadius: 40)
                .foregroundStyle(Color.white)
                .overlay {
                    HStack(spacing: 10) {
                        Image(buttonIcon)
                        Text(buttonTitle)
                            .font(.boldFont(ofSize: 15))
                            .foregroundStyle(Color.socialMediaButtonTextColor())
                    }
                }
        })
        .frame(height: 46)
        .shadow(color: .socialMediaButtonShadowColor(), radius: 4, y: 4)
    }
}

#Preview {
    MAISocialLoginButton(buttonTitle: "Facebook", buttonIcon: "fb_icon", buttonAction: {
        
    })
}
