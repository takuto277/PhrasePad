//
//  ContentView.swift
//  PhrasePad
//
//  Created by 小野拓人 on 2024/08/03.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.colorScheme) var scheme
    private let date = Date()
    private let colors = [Color.green, .pink, .blue, .orange, .purple]
    private let titles = ["豆腐", "寿司", "忍者", "温泉", "漫画"]
    
    var body: some View {
        TimelineView(.animation) { context in
            let index = (Int(context.date.timeIntervalSince(date)) + 1) % colors.count
            let color = colors[index]
            Text(titles[index])
                .contentTransition(.numericText(countsDown: true))
                .animation(.default, value: index)
                .font(.system(size: 65, weight: .thin))
                .frame(width: 250)
                .shadow(color: color, radius: 5)
                .shadow(color: color, radius: 50)
                .shadow(color: color, radius: 100)
                .shadow(color: color, radius: 150)
                .shadow(color: color, radius: 200)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundStyle(scheme == .light ? AnyShapeStyle(.background) : AnyShapeStyle(.foreground))
        .background(scheme == .light ? AnyShapeStyle(.foreground) : AnyShapeStyle(.background))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
