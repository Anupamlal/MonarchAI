//
//  MAIButton.swift
//  MonarchAI
//
//  Created by Anupam Lal on 11/05/24.
//

import SwiftUI

struct MAIButton: View {
    
    var buttonTitle: String
    var backgroundEnable: Bool
    var buttonAction:(()->())
    
    var body: some View {
        
        Button(action: {
            buttonAction()
            
        }, label: {
            
            if (backgroundEnable) {
                RoundedRectangle(cornerRadius: 40)
                    .foregroundStyle(
                        LinearGradient(colors: [Color.gradientStartColor(), .appThemeColor()], startPoint: .leading, endPoint: .trailing)
                    )
                    .overlay {
                        Text(buttonTitle)
                            .font(.boldFont(ofSize: 16))
                            .foregroundStyle(.white)
                    }
            }else {
                Text(buttonTitle)
                    .font(.boldFont(ofSize: 16))
            }
            
        })
        .frame(height: 54)
        .shadow(radius: 10, y: 4)
    }
}

#Preview {
    MAIButton(buttonTitle: "Button", backgroundEnable: true, buttonAction: {
        
    })
}
