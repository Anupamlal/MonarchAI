//
//  MAIMenuView.swift
//  MonarchAI
//
//  Created by Anupam Lal on 18/05/24.
//

import SwiftUI

struct MAIMenuView: View {
    
    @Binding var selectedMenuNameIndex:Int?
    var placeHolderName: String
    var menuOptions:[String]
    
    var body: some View {
        
        Menu {
            
            ForEach(0..<menuOptions.count, id: \.self) { optionIndex in
                Button(menuOptions[optionIndex], action: {
                    selectedMenuNameIndex = optionIndex
                })
            }
            
        } label: {
            HStack {
                Text(selectedMenuNameIndex != nil ? menuOptions[selectedMenuNameIndex ?? 0] : placeHolderName)
                    .foregroundStyle(selectedMenuNameIndex == nil ? Color.gray : Color.primary)
                    .padding()
                Spacer()
            }
            
        }
        .font(.regularFont(ofSize: 16))
        .frame(height: 56)
        .background {
            RoundedRectangle(cornerRadius: 8)
                .stroke(lineWidth: 1.0)
                .foregroundStyle(Color.strokeColor())
        }
    }
}

#Preview {
    MAIMenuView(selectedMenuNameIndex: .constant(0), placeHolderName: "", menuOptions: ["Gender"])
}


