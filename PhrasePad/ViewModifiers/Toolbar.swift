//
//  Toolbar.swift
//  PhrasePad
//
//  Created by 小野拓人 on 2024/08/05.
//

import SwiftUI

// 上部ツールバー設定
struct Toolbar: ViewModifier {
    @Binding var showMenu: Bool
    @Binding var path: [Path]
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    listIcon()
                }
                ToolbarItem(placement: .principal) {
                    imageTitle()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    plusIcon()
                }
            }
    }
    
    private func listIcon() -> some View {
        Button {
            withAnimation {
                showMenu.toggle()
            }
        } label: {
            Image(systemName: "list.bullet")
                .fontWeight(.bold)
        }
    }
    
    private func imageTitle() -> some View {
        Image("nou")
            .resizable()
            .scaledToFill()
            .frame(width: 30)
    }
    
    private func plusIcon() -> some View {
        Button {
            path.append(.plus)
        } label: {
            Image(systemName: "plus.circle")
                .fontWeight(.bold)
        }
    }
}
