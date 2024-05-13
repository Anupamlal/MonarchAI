//
//  View+Extension.swift
//  MonarchAI
//
//  Created by Anupam Lal on 13/05/24.
//

import UIKit
import SwiftUI

extension UIView {
    var parentViewController: UIViewController? {
        sequence(first: self) {
            $0.next
        }.first { $0 is UIViewController } as? UIViewController
    }
}

fileprivate extension UINavigationController {
    func addInteractivePopGesture(_ gesture: UIPanGestureRecognizer) {
        guard let gestureSelector = interactivePopGestureRecognizer?.value(forKey: "targets") else { return }
        
        gesture.setValue(gestureSelector, forKey: "targets")
        view.addGestureRecognizer(gesture)
    }
}

struct AttachPopGestureView: UIViewRepresentable {
    @Binding var gesture: UIScreenEdgePanGestureRecognizer
    
    func makeUIView(context: Context) -> some UIView {
        return UIView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.02) {
            if let parentVC = uiView.parentViewController {
                if let navigationController = parentVC.navigationController {
                    
                    // To prevent duplication
                    guard !(navigationController.view.gestureRecognizers?
                        .contains(where: {$0.name == gesture.name}) ?? true) else { return }
                
                    navigationController.addInteractivePopGesture(gesture)
                }
            }
        }
    }
}

