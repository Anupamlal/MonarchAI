//
//  MAINavigationButton.swift
//  MonarchAI
//
//  Created by Anupam Lal on 11/05/24.
//

import SwiftUI

struct MAINavigationButton<Destination: View>: View {
    
    var buttonTitle: String
    var backgroundEnable: Bool
    var destination: Destination

    init(buttonTitle: String, backgroundEnable: Bool, destination: Destination) {
        self.buttonTitle = buttonTitle
        self.backgroundEnable = backgroundEnable
        self.destination = destination
    }
    
    var body: some View {
        
        NavigationLink {
            destination
            
        } label: {
            
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
            
        }
        .frame(height: 54)
        .shadow(radius: 10, y: 4)
    }
}

#Preview {
    MAINavigationButton(buttonTitle: "Click me", backgroundEnable: true, destination: Text("Destination"))
}
