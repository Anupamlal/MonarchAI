//
//  AddChildView.swift
//  MonarchAI
//
//  Created by Anupam Lal on 12/05/24.
//

import SwiftUI

struct AddChildView: View {
    
    @State var childNameField: String = ""
    @State var childGenderField: String = ""
    @State var childDOBField: String = ""
    
    var body: some View {
        MAINavigationStack(
            sourceView:
                VStack {
                    
                    Button(action: {
                        
                    }, label: {
                        Image("dp_avatar")
                            .overlay {
                                Image("edit_icon")
                                    .padding(.leading, 80)
                                    .padding(.top, 68)
                            }
                        
                    })
                    .padding(.top, 60)
                    
                    MAITextField(textFieldBinding: $childNameField, placeholder: "Name")
                        .padding(.all, 30)
                    
                    HStack(spacing: 20) {
                        MAITextField(textFieldBinding: $childGenderField, placeholder: "Gender")
                            
                        MAITextField(textFieldBinding: $childDOBField, placeholder: "DD/MM/YYYY")
                    }
                    .padding(.horizontal, 30)
                    
                    MAINavigationButton(buttonTitle: "Add", backgroundEnable: true, destination: HomeScreenView())
                        .padding(.all, 30)
                        .padding(.bottom, 60)
                    
                    Spacer()
                },
            navigationTitle: "Add a child"
        )
    }
}

#Preview {
    AddChildView()
}
