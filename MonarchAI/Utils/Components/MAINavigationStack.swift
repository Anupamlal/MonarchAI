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
    var navigationBarBackgroundEnable: Bool = false
    
    @Environment(\.dismiss) private var dismiss
    
    init(sourceView: Root, navigationTitle: String) {
        self.sourceView = sourceView
        self.navigationTitle = navigationTitle
    }
    
    init(sourceView: Root, navigationTitle: String, navigationBarBackgroundEnable: Bool) {
        self.sourceView = sourceView
        self.navigationTitle = navigationTitle
        self.navigationBarBackgroundEnable = navigationBarBackgroundEnable
    }
    
    var body: some View {
        NavigationStack {
            sourceView
        }
        .toolbarBackground(Color.white, for: .navigationBar)
        .toolbarBackground(navigationBarBackgroundEnable ? .visible : .hidden, for: .navigationBar)
        .background(Color.white)
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
