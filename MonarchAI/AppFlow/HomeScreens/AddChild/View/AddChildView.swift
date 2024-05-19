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
    @State var selectedGenderIndex:Int?
    @State var showPhotoSources: Bool = false
    @State var selectedImage:UIImage?
    @State var showPhotoPickerView: Bool = false
    @State var photoPickerSourceType: UIImagePickerController.SourceType = .camera
    @State var nameEditingDisable = false {
        didSet {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
    
    var genderOptions:[String] = ["Male", "Female", "Not defined"]
    
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
                        showPhotoSources = true
                    }, label: {
                        Group {
                            if let someImage = self.selectedImage {
                                Image(uiImage: someImage)
                                    .resizable()
                                    .scaledToFit()
                                    
                            }else {
                                Image("dp_avatar")
                                    .resizable()
                            }
                        }
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(content: {
                            Circle()
                                .strokeBorder(Color.childDPBorderColor())
                        })
                        .overlay {
                            Image("edit_icon")
                                .padding(.leading, 80)
                                .padding(.top, 68)
                        }
                        
                        
                    })
                    .padding(.top, 60)
                    
                    MAITextField(textFieldBinding: $childNameField, placeholder: "Name")
                        .padding(.all, 30)
                        .onTapGesture {
                            isDatePickerVisible = false
                        }
                    
                    
                    HStack(spacing: 20) {
                        MAIMenuView(selectedMenuNameIndex: $selectedGenderIndex, placeHolderName: "Gender", menuOptions: genderOptions)
                            .onTapGesture {
                                nameEditingDisable = true
                                isDatePickerVisible = false
                            }
                        
                        Group {
                            if childDOBField.count > 0 {
                                Text(childDOBField)
                            }else {
                                Text("DD/MM/YYYY")
                                    .foregroundStyle(Color.gray)
                            }
                        }
                        .font(.regularFont(ofSize: 16))
                        .padding()
                        .frame(height: 56)
                        .frame(width: SCREEN_SIZE.width/2.5)
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(lineWidth: 1.0)
                                .foregroundStyle(Color.strokeColor())
                        }
                        .onTapGesture {
                            withAnimation(.snappy) {
                                nameEditingDisable = true
                                isDatePickerVisible.toggle()
                            }
                            
                        }
                        
                    }
                    .padding(.horizontal, 30)
                    
                    if isDatePickerVisible {
                        DatePicker("", selection: $childDOBDate, in: ...Date.now, displayedComponents: .date)
                            .datePickerStyle(.graphical)
                            .onChange(of: childDOBDate, perform: { value in
                                self.setDateString()
                                withAnimation(.snappy) {
                                    isDatePickerVisible = false
                                }
                            })
                            .padding(.horizontal, 30)
                    }
                    
                    MAINavigationButton(buttonTitle: "Add", backgroundEnable: true, destination: HomeScreenView())
                        .padding(.all, 30)
                        .padding(.bottom, 60)
                        .onTapGesture {
                            nameEditingDisable = true
                            isDatePickerVisible = false
                        }
                    
                    Spacer()
                }
                .confirmationDialog("",
                                    isPresented: $showPhotoSources,
                                    titleVisibility: .hidden,
                                    actions: {
                                        
                                        Button("Camera", role: .none) {
                                            showPhotoPickerView = true
                                            photoPickerSourceType = .camera
                                        }
                                        
                                        Button("Gallery", role: .none) {
                                            showPhotoPickerView = true
                                            photoPickerSourceType = .photoLibrary
                                        }
                                        
                                        Button("Cancel", role: .cancel) {
                                            showPhotoSources = false
                                        }
                                    })
                .fullScreenCover(isPresented: $showPhotoPickerView) {
                    MAIPhotoPickerView(selectedImage: self.$selectedImage, sourceType: photoPickerSourceType)
                }
            ,
            navigationTitle: "Add a child"
        )
    }
    
    private func setDateString() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/YYYY"
        self.childDOBField = formatter.string(from: childDOBDate)
    }

}

#Preview {
    AddChildView()
}
