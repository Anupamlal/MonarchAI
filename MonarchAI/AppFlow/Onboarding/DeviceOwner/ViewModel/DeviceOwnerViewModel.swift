//
//  DeviceOwnerViewModel.swift
//  MonarchAI
//
//  Created by Anupam Lal on 11/05/24.
//

import SwiftUI

enum DeviceOwnerType {
    case none
    case parent
    case kids
}

class DeviceOwnerViewModel {
        
    func getOwnerHeadlineText(for owner: DeviceOwnerType) -> String {
        return owner == .parent ? "Parent's phone" : "Child's phone"
    }
    
    func getOwnerTitleText(for owner: DeviceOwnerType) -> String {
        return owner == .parent ? "I want to use this device for\nmanagement" : "I want to monitor this\ndevice"
    }
    
    func getOwnerDeviceImage(for owner: DeviceOwnerType) -> String {
        return owner == .parent ? "parents_phone" : "kids_phone"
    }
    
    func getOwnerCardBackGroundColor(for owner: DeviceOwnerType) -> Color {
        return owner == .parent ? Color.parentsColor() : Color.kidsColor()
    }
}
