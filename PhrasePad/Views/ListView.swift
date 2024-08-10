//
//  ListView.swift
//  PhrasePad
//
//  Created by 小野拓人 on 2024/08/04.
//

import SwiftUI
import ComposableArchitecture

@ObservableState
struct ListState: Equatable {
        var path: [Path] = []
    var showMenu: Bool = false
}

enum ListAction: Equatable {
    case toggleMenu
    case updatePath(Path)
}

@Reducer
struct ListReducer {
    var body: some Reducer<ListState, ListAction> {
        Reduce { state, action in
            switch action {
            case .toggleMenu:
                state.showMenu.toggle()
                return .none
            case .updatePath(let path):
                state.path.append(path)
                return .none
            }
        }
    }
}

struct ListView: View {
    @Bindable var store: StoreOf<ListReducer>
    
    var body: some View {
        NavigationStack {
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
                .modifier(Toolbar(store: store))
                .backgroundDark()
            }
            // メニューリスト設定
            .modifier(MenuList(store: store))
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(store: Store(initialState: ListState(), reducer: {
            ListReducer()
        }))
        .preferredColorScheme(.dark)
    }
}
