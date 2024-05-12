//
//  TutorialViewModel.swift
//  MonarchAI
//
//  Created by Anupam Lal on 11/05/24.
//

import Foundation

class TutorialViewModel: ObservableObject {
    
    var deviceOwnerType: DeviceOwnerType
    @Published var selectedIndexOfCarousal = 0
    
    private let parentTutorialImages = ["keep_ur_child_safe_online","superwise_the_way_you_want","build_positive_habits"]
    private let kidsTutorialImages = ["superwise_the_way_you_want","build_positive_habits"]
    
    private let parentTutorialHeadlineTexts = ["Keep your child safe online", "Supervise the way you want", "Build positive digital habits"]
    private let parentTutorialTitleTexts = ["Ensure your child digital activity is balanced and risk free", "Filter website, set screen time limits, block apps, get activity reports, and more.", "Help your child develop a healthy relationship with technology"]
    
    private let kidsTutorialHeadlineTexts = ["Know What They See", "Set Healthy Habits Together"]
    private let kidsTutorialTitleTexts = ["Monitor online activity, keeping parents informed about their child's digital world.", "Establishing screen time limits and responsible digital habits as a family, not just restrictions imposed by parents."]

    
    init(deviceOwnerType: DeviceOwnerType) {
        self.deviceOwnerType = deviceOwnerType
    }
    
    func getHeadineText(at index: Int) -> String{
        return self.deviceOwnerType == .parent ? parentTutorialHeadlineTexts[index] : kidsTutorialHeadlineTexts[index]
    }
    
    func getTitleText(at index: Int) -> String{
        return self.deviceOwnerType == .parent ? parentTutorialTitleTexts[index] : kidsTutorialTitleTexts[index]
    }
    
    func getTutorialImages() -> [String] {
        return self.deviceOwnerType == .parent ? self.parentTutorialImages : self.kidsTutorialImages
    }
    
    func getNextButtonText() -> String {
        if self.deviceOwnerType == .parent {
            return selectedIndexOfCarousal == parentTutorialImages.count - 1 ? "Get Started" : "Next"
        }
        return selectedIndexOfCarousal == kidsTutorialImages.count - 1 ? "Get Started" : "Next"
    }
    
    func getCountOfTutorialPage() -> Int {
        return self.deviceOwnerType == .parent ? self.parentTutorialImages.count : self.kidsTutorialImages.count
    }
}
