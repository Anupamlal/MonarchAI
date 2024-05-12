//
//  DeviceOwnerView.swift
//  MonarchAI
//
//  Created by Anupam Lal on 11/05/24.
//

import SwiftUI

struct DeviceOwnerView: View {
    
    @EnvironmentObject private var appRootManager: AppRootManager
    
    var body: some View {
        NavigationStack{
            VStack {
                Text("Whose device is this ?")
                    .font(.semiBoldFont(ofSize: 20))
                    .padding(.top, 20)
                
                Spacer()
                
                VStack(spacing: 80) {
                    DeviceSelectorView(deviceOwnerType: .parent)
                    DeviceSelectorView(deviceOwnerType: .kids)
                }
                Spacer()
            }
        }
        
        
    }
}

struct DeviceSelectorView: View {
    
    var deviceOwnerType: DeviceOwnerType
    var deviceOwnerViewModel = DeviceOwnerViewModel()
    
    var body: some View {
        
        NavigationLink {
            
            TutorialView(deviceOwnerType: deviceOwnerType)
            
        } label: {
            RoundedRectangle(cornerRadius: 8)
                .frame(width: SCREEN_SIZE.width - 56, height: 155)
                .foregroundStyle(deviceOwnerViewModel.getOwnerCardBackGroundColor(for: deviceOwnerType))
                .overlay {
                    VStack(spacing: 10) {
                        
                        Image(deviceOwnerViewModel.getOwnerDeviceImage(for: deviceOwnerType))
                            .padding(.top, -65)
                        
                        Text(deviceOwnerViewModel.getOwnerHeadlineText(for: deviceOwnerType))
                            .font(.semiBoldFont(ofSize: 16))
                        
                        Text(deviceOwnerViewModel.getOwnerTitleText(for: deviceOwnerType))
                            .font(.regularFont(ofSize: 14))
                            .multilineTextAlignment(.center)
                    }
                    .foregroundStyle(.black)
                }
        }
    }
}


#Preview {
    DeviceOwnerView()
}
