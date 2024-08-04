//
//  mulchSadow.swift
//  PhrasePad
//
//  Created by 小野拓人 on 2024/08/04.
//

import SwiftUI

// 影生成
struct MulchSadow: ViewModifier {
    let color: Color
    func body(content: Content) -> some View {
        content
            .shadow(color: color, radius: 5)
            .shadow(color: color, radius: 50)
            .shadow(color: color, radius: 100)
            .shadow(color: color, radius: 150)
            .shadow(color: color, radius: 200)
    }
}
