//
//  ColorExtension.swift
//  PhrasePad
//
//  Created by 小野拓人 on 2024/08/04.
//

import SwiftUI

extension Color {
    // 色のコンポーネントを取得するプロパティ
    var components: (red: Double, green: Double, blue: Double) {
        let description = self.description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var hex: UInt64 = 0
        Scanner(string: description).scanHexInt64(&hex)
        let mask = 0x000000FF
        let red = Double(Int(hex >> 16) & mask) / 255.0
        let green = Double(Int(hex >> 8) & mask) / 255.0
        let blue = Double(Int(hex) & mask) / 255.0
        return (red, green, blue)
    }
    
    // 明るさ（ルミナンス）を計算するプロパティ
    var luminance: Double {
        let components = self.components
        return 0.299 * components.red + 0.587 * components.green + 0.114 * components.blue
    }
    
    // カラーの明るさに基づいて、適切なテキストカラーを選択
    func textColor(for color: Color) -> Color {
        let luminance = color.luminance
        return luminance > 0.5 ? .black : .white
    }
    
    // ランダムな色を生成
    static func randomColor(for index: Int) -> Color {
        let seed = UInt64(index * Int.random(in: 0...1000))
        var generator = SeededGenerator(seed: seed)
        return Color(
            red: Double.random(in: 0...1, using: &generator),
            green: Double.random(in: 0...1, using: &generator),
            blue: Double.random(in: 0...1, using: &generator)
        )
    }
}
