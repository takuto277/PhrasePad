//
//  ContentView.swift
//  PhrasePad
//
//  Created by 小野拓人 on 2024/08/03.
//

import SwiftUI
import SwiftData
import ComposableArchitecture

@ObservableState
struct HomeState: Equatable {
    var showListView = false
    let date = Date()
}

enum HomeAction: Equatable {
    case toggleListView
    
}

struct HomeEnvironment {
    var mainQueue: AnySchedulerOf<DispatchQueue>
}

@Reducer
struct HomeReducer {
    var body: some Reducer<HomeState, HomeAction> {
        Reduce { state, action in
            switch action {
            case .toggleListView:
                state.showListView.toggle()
                return .none
            }
        }
    }
}

struct HomeView: View {
    let store: StoreOf<HomeReducer>
    @Environment(\.colorScheme) var scheme
    private let titles = ["Clip", "コピペ", "Copy", "転写", "Paste", "複写", "添付", "Attach", "引用", "Quote", "切取", "Cut", "貼付"]
    
    @State private var showListView = false
    
    var body: some View {
        ZStack {
            if store.showListView {
                ListView()
                    .transition(.opacity)
            } else {
                homeContent(store: store)
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut, value: store.showListView)
    }
    
    // タイトル画面
    private func homeContent(store: StoreOf<HomeReducer>) -> some View {
        ZStack {
            TimelineView(.animation(minimumInterval: 1.0, paused: false)) { context in
                let index = (Int(context.date.timeIntervalSince(store.date)) + 1) % titles.count
                
                let color = Color.randomColor(for: index)
                Text(titles[index])
                    .contentTransition(.numericText(countsDown: true))
                    .animation(.default, value: index)
                    .font(.system(size: 80, weight: .thin))
                    .frame(width: 250)
                    .mulchSadow(color: color)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .backgroundDark()
            
            VStack(alignment: .center) {
                Spacer()
                    .frame(height: UIScreen.main.bounds.height * 0.1)
                
                Text("PhrasePad")
                    .font(.system(size: 65, weight: .bold))
                    .foregroundStyle(Color.white)
                    .mulchSadow(color: .gray)
                Text("万能なコピペ帳")
                    .font(.system(size: 20, weight: .bold))
                    .mulchSadow(color: .white)
                
                Spacer()
                Text("画面をタップ")
                    .font(.system(size: 30, weight: .bold))
                    .blinkEffect()
                    .backgroundDark()
                Spacer()
                    .frame(height: UIScreen.main.bounds.height * 0.1)
            }
        }
        .onTapGesture {
            store.send(.toggleListView)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(
            store: Store(initialState: HomeState(), reducer: {
                HomeReducer()
            }
                        )
        )
        .preferredColorScheme(.light)
    }
}
