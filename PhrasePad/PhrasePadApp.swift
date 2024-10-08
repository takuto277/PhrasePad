//
//  PhrasePadApp.swift
//  PhrasePad
//
//  Created by 小野拓人 on 2024/08/03.
//

import SwiftUI
import SwiftData
import ComposableArchitecture

@main
struct PhrasePadApp: App {
    static let store = Store(initialState: HomeState()) {
        HomeReducer()
            ._printChanges()
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView(store: PhrasePadApp.store)
        }
    }
}
