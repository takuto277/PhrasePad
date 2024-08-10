//
//  MenuList.swift
//  PhrasePad
//
//  Created by 小野拓人 on 2024/08/05.
//

import SwiftUI
import ComposableArchitecture

// メニューリスト設定
struct MenuList: ViewModifier {
    @Bindable var store: StoreOf<ListReducer>
    func body(content: Content) -> some View {
        content
            .overlay(
                VStack {
                    if store.showMenu {
                        VStack(alignment: .leading, spacing: 10) {
                            Button {
                                store.send(.toggleMenu)
                            } label: {
                                HStack {
                                    Image(systemName: "arrow.up.arrow.down")
                                        .frame(width: 30)
                                    Text("整理")
                                }
                            }
                            .padding(.vertical, 5)
                            .frame(width: 70)
                            
                            Button {
                                store.send(.toggleMenu)
                            } label: {
                                HStack {
                                    Image(systemName: "trash")
                                        .frame(width: 30)
                                    Text("削除")
                                }
                                .foregroundStyle(.red)
                            }
                            .padding(.vertical, 5)
                            .frame(width: 70)
                            
                            Button {
                                store.send(.updatePath(.gear))
                                store.send(.toggleMenu)
                            } label: {
                                HStack {
                                    Image(systemName: "gear")
                                        .frame(width: 30)
                                    Text("設定")
                                }
                            }
                            .padding(.vertical, 5)
                            .frame(width: 70)
                            
                        }
                        .padding()
                        .background(.gray)
                        .foregroundStyle(.black)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding(.top, 40)
                        .transition(.opacity)
                    }
                }
                    .animation(.easeInOut, value: store.showMenu),
                alignment: .topLeading
            )
    }
}
