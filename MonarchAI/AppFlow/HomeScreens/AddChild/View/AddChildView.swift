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
    @State var childDOBDate = Date()
    @State private var isDatePickerVisible = false
    @State private var isChildDOBPresent = false
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
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
                        
                        Group {
                            if isChildDOBPresent {
                                Text(childDOBField)
                            }else {
                                Text("DD/MM/YYYY")
                                    .foregroundStyle(Color.gray)
                            }
                        }
                        .font(.regularFont(ofSize: 16))
                        .padding()
                        .frame(height: 56)
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(lineWidth: 1.0)
                                .foregroundStyle(Color.strokeColor())
                        }
                        .onTapGesture {
                            isDatePickerVisible.toggle()
                        }
                        
                    }
                    .padding(.horizontal, 30)
                    
                    if isDatePickerVisible {
                        DatePicker("", selection: $childDOBDate, in: ...Date.now, displayedComponents: .date)
                            .datePickerStyle(.wheel)
                            .labelsHidden()
                            .onChange(of: childDOBDate, perform: { value in
                                isChildDOBPresent = true
                                childDOBField = value.formatted(date: .numeric, time: .omitted)
                            })
                    }
                    
                    MAINavigationButton(buttonTitle: "Add", backgroundEnable: true, destination: HomeScreenView())
                        .padding(.all, 30)
                        .padding(.bottom, 60)
                    
                    Spacer()
                }
                .onTapGesture {
                    isDatePickerVisible = false
                },
            navigationTitle: "Add a child"
        )
    }
}

#Preview {
    AddChildView()
}
