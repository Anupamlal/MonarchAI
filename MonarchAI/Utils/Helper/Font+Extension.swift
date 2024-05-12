//
//  Font+Extension.swift
//  MonarchAI
//
//  Created by Anupam Lal on 11/05/24.
//

import Foundation
import SwiftUI

// Font stated as 400 = Regular, 600 = SemiBold, 700 = Bold

extension Font {
    
    static func regularFont(ofSize size: CGFloat) -> Font {
        return Font.custom("Inter-Regular", size: size)
    }
    
    static func semiBoldFont(ofSize size: CGFloat) -> Font {
        return Font.custom("Inter-SemiBold", size: size)
    }
    
    static func boldFont(ofSize size: CGFloat) -> Font {
        return Font.custom("Inter-Bold", size: size)
    }
}
