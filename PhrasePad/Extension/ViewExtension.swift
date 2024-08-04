//
//  ViewExtension.swift
//  PhrasePad
//
//  Created by 小野拓人 on 2024/08/04.
//

import SwiftUI

extension View {
    // 点滅機能の呼び出し
    func blinkEffect(opacity: ClosedRange<Double> = 0.1...1, interval: Double = 0.6) -> some View {
        self.modifier(BlinkEffect(opacityRange: opacity, interval: interval))
    }
    // 背景を暗くする
    func backgroundDark() -> some View {
        self.modifier(BackgroundDark())
    }
    // 影生成
    func mulchSadow(color: Color) -> some View {
        self.modifier(MulchSadow(color: color))
    }
}
