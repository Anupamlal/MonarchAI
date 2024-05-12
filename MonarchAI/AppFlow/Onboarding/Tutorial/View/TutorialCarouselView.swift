//
//  TutorialCarouselView.swift
//  MonarchAI
//
//  Created by Anupam Lal on 11/05/24.
//

import SwiftUI

struct TutorialCarouselView: View {
    
    let tutorialImages:[String]
    @Binding var selectedCarousal:Int
    
    var body: some View {
        TabView(selection: $selectedCarousal) {
            
            ForEach(0..<tutorialImages.count, id: \.self) { imageIndex in
                Image(tutorialImages[imageIndex])
                    .resizable()
                    .scaledToFit()
                    .frame(width: SCREEN_SIZE.width - 88)
                    .tag(imageIndex)
            }
        }
        .frame(height: 377)
        .tabViewStyle(.page(indexDisplayMode: .never))
        
    }
}

struct DotView: View {
    
    var numberOfDot: Int
    @Binding var selectedIndexOfDot: Int
    
    var body: some View {
        
        HStack {
            ForEach(0..<numberOfDot, id: \.self) { index in
                
                Circle()
                    .frame(width: selectedIndexOfDot == index ? 20 : 13, height: selectedIndexOfDot == index ? 20 : 13)
                    .foregroundStyle(Color.dotColor(isSelected: selectedIndexOfDot == index))
                
            }
        }
        
    }
}

#Preview {
    TutorialCarouselView(tutorialImages: [String](), selectedCarousal: .constant(0))
}
