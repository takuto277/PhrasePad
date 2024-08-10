//
//  Toolbar.swift
//  PhrasePad
//
//  Created by 小野拓人 on 2024/08/05.
//

import SwiftUI
import ComposableArchitecture

// 上部ツールバー設定
struct Toolbar: ViewModifier {
    @Bindable var store: StoreOf<ListReducer>
    
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
                store.send(.toggleMenu)
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
            store.send(.updatePath(.plus))
        } label: {
            Image(systemName: "plus.circle")
                .fontWeight(.bold)
        }
    }
}
