//
//  MAINavigationStack.swift
//  MonarchAI
//
//  Created by Anupam Lal on 11/05/24.
//

import SwiftUI
//struct NavigationStack<Data, Root> : View where Root : View

struct MAINavigationStack<Root:View> : View {
    
    var sourceView: Root
    var navigationTitle: String
    
    @Environment(\.dismiss) private var dismiss
    
    init(sourceView: Root, navigationTitle: String) {
        self.sourceView = sourceView
        self.navigationTitle = navigationTitle
        removeBottomBorder()
    }
    
    func removeBottomBorder() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.shadowColor = .clear
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    @State private var interactivePopGestureRecognizer: UIScreenEdgePanGestureRecognizer = {
        let gesture = UIScreenEdgePanGestureRecognizer()
        gesture.name = UUID().uuidString
        gesture.edges = UIRectEdge.left
        gesture.isEnabled = true
        return gesture
    }()
    
    var body: some View {
        NavigationStack {
            sourceView
                .background {
                    AttachPopGestureView(gesture: $interactivePopGestureRecognizer)
                }
        }
        .navigationTitle(Text(navigationTitle))
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Image(systemName: "chevron.backward")
                            .bold()
                            .tint(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    MAINavigationStack(sourceView: Text("hi"), navigationTitle: "Log in")
}
