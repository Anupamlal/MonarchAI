//
//  TutorialView.swift
//  MonarchAI
//
//  Created by Anupam Lal on 11/05/24.
//

import SwiftUI

struct TutorialView: View {
    
    var deviceOwnerType: DeviceOwnerType
    @StateObject var tutorialViewModel: TutorialViewModel
    
    init(deviceOwnerType: DeviceOwnerType) {
        self.deviceOwnerType = deviceOwnerType
        _tutorialViewModel = StateObject(wrappedValue: TutorialViewModel(deviceOwnerType: deviceOwnerType))
    }
    
    var body: some View {
        
        NavigationStack {
            VStack(spacing: 30) {
                VStack(spacing: 0) {
                    TutorialCarouselView(tutorialImages: self.tutorialViewModel.getTutorialImages(), selectedCarousal: $tutorialViewModel.selectedIndexOfCarousal)
                    
                    DotView(numberOfDot: self.tutorialViewModel.getCountOfTutorialPage(), selectedIndexOfDot: $tutorialViewModel.selectedIndexOfCarousal)
                }
                            
                VStack(spacing: 15) {
                    Text(tutorialViewModel.getHeadineText(at: tutorialViewModel.selectedIndexOfCarousal))
                        .font(.boldFont(ofSize: 24))
                    
                    
                    Text(tutorialViewModel.getTitleText(at: tutorialViewModel.selectedIndexOfCarousal))
                        .font(.regularFont(ofSize: 16))
                        .multilineTextAlignment(.center)
                    
                }
                .padding(.horizontal, 30)
                
                if self.tutorialViewModel.selectedIndexOfCarousal == self.tutorialViewModel.getCountOfTutorialPage() - 1 {
                    
                    MAINavigationButton(
                        buttonTitle: tutorialViewModel.getNextButtonText(),
                        backgroundEnable: true,
                        destination:ParentSignUp()
                    )
                    .padding(.horizontal, 25)
                    
                }else {
                    MAIButton(
                        buttonTitle: tutorialViewModel.getNextButtonText(),
                        backgroundEnable: true
                    ) {
                        withAnimation(.snappy) {
                            self.nextButtonAction()
                        }
                    }
                    .padding(.horizontal, 25)
                }
                
                Spacer()
                
                HStack(spacing: 4) {
                    Text("Already have an account?")
                        .font(.boldFont(ofSize: 16))
                    
                    NavigationLink {
                        ParentLoginView()
                    } label: {
                        Text("Log in")
                            .font(.boldFont(ofSize: 16))
                            .foregroundColor(.appThemeColor())
                    }
                }
                .padding(.bottom, 30)
                
            }
            .navigationBarHidden(true)
        }
        
        
    }
    
    func nextButtonAction() {
        
        if self.tutorialViewModel.selectedIndexOfCarousal < self.tutorialViewModel.getCountOfTutorialPage() - 1{
            self.tutorialViewModel.selectedIndexOfCarousal += 1
        }

    }
    
}

#Preview {
    TutorialView(deviceOwnerType: .parent)
}
