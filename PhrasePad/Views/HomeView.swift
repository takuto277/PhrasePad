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
    private let titles = ["Clip", "コピペ", "Copy", "転写", "Paste", "複写", "添付", "Attach", "引用", "Quote", "切取", "Cut", "貼付"]
    
    var body: some View {
        ZStack {
            TimelineView(.animation(minimumInterval: 1.0, paused: false)) { context in
                let index = (Int(context.date.timeIntervalSince(date)) + 1) % titles.count
                
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
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
    }
}
