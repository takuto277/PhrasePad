//
//  MenuList.swift
//  PhrasePad
//
//  Created by 小野拓人 on 2024/08/05.
//

import SwiftUI

// メニューリスト設定
struct MenuList: ViewModifier {
    @Binding var showMenu: Bool
    @Binding var path: [Path]
    
    func body(content: Content) -> some View {
        content
            .overlay(
                VStack {
                    if showMenu {
                        VStack(alignment: .leading, spacing: 10) {
                            Button {
                                showMenu.toggle()
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
                                showMenu.toggle()
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
                                path.append(.gear)
                                showMenu.toggle()
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
                    .animation(.easeInOut, value: showMenu),
                alignment: .topLeading
            )
    }
}
