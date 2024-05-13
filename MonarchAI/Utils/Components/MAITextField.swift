//
//  MAITextField.swift
//  MonarchAI
//
//  Created by Anupam Lal on 12/05/24.
//

import SwiftUI

struct MAITextField: View {
    
    @Binding var textFieldBinding:String
    var placeholder:String
    var imageName: String?
    var keyboardType:UIKeyboardType?
    var onEditingChanged: ((Bool) -> Void)?
    
    var body: some View {
        HStack {
            
            if let imageName = imageName {
                Image(imageName)
            }
            
            TextField(placeholder, text: $textFieldBinding) { status in
                if let onEditingChanged = onEditingChanged{
                    onEditingChanged(status)
                }
            }
            .font(.regularFont(ofSize: 16))
            .tint(.appThemeColor())
            .keyboardType(keyboardType == nil ? .default : keyboardType!)
            .submitLabel(.done)
            
        }
        .padding()
        .frame(height: 56)
        .background {
            RoundedRectangle(cornerRadius: 8)
                .stroke(lineWidth: 1.0)
                .foregroundStyle(Color.strokeColor())
        }
    }
}

#Preview {
    MAITextField(textFieldBinding: .constant(""), placeholder: "Email")
}
