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
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    var body: some View {
        NavigationStack {
            sourceView
        }
        .toolbarBackground(Color.white, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
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
