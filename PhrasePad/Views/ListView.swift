//
//  ListView.swift
//  PhrasePad
//
//  Created by 小野拓人 on 2024/08/04.
//

import SwiftUI

struct ListView: View {
    @State private var path = [Path]()
    @State private var showMenu = false
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Path.self) { path in
                switch path {
                case .gear:
                    SettingView()
                case .plus:
                    RegistrationView()
                }
            }
            // ナビゲーションバーに要素を配置
            .modifier(Toolbar(showMenu: $showMenu, path: $path))
            .backgroundDark()
        }
        // メニューリスト設定
        .modifier(MenuList(showMenu: $showMenu, path: $path))
    }
}

#Preview {
    ListView()
        .preferredColorScheme(.dark)
}
