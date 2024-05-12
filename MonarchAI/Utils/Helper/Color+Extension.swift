//
//  Color+Extension.swift
//  MonarchAI
//
//  Created by Anupam Lal on 11/05/24.
//

import SwiftUI

extension Color {
    
    static func parentsColor() -> Color {
        return .init(uiColor:  UIColor(red: 26/255, green: 138/255, blue: 176/255, alpha: 0.08))
    }
    
    static func kidsColor() -> Color {
        return .init(uiColor:  UIColor(red: 111/255, green: 55/255, blue: 128/255, alpha: 0.08))
    }
    
    static func dotColor(isSelected: Bool) -> Color {
        return .init(uiColor:  UIColor(red: 26/255, green: 138/255, blue: 176/255, alpha: isSelected ? 1.0 : 0.3))
    }
    
    static func gradientStartColor() -> Color {
        return .init(uiColor:  UIColor(red: 26/255, green: 138/255, blue: 176/255, alpha: 1.0))
    }
    
    static func appThemeColor() -> Color {
        return .init(uiColor:  UIColor(red: 111/255, green: 55/255, blue: 128/255, alpha: 1.0))
    }

    static func strokeColor() -> Color {
        return .init(uiColor:  UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1.0))
    }
    
    static func separatorLineColor() -> Color {
        return .init(uiColor:  UIColor(red: 225/255, green: 225/255, blue: 225/255, alpha: 1.0))
    }
    
    static func socialMediaButtonTextColor() -> Color {
        return .init(uiColor:  UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1.0))
    }
    
    static func socialMediaButtonShadowColor() -> Color {
        return .init(uiColor:  UIColor(red: 129/255, green: 129/255, blue: 129/255, alpha: 0.25))
    }
}
