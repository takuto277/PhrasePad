//
//  BackgroundDark.swift
//  PhrasePad
//
//  Created by 小野拓人 on 2024/08/04.
//

import SwiftUI

// 背景を暗くする
struct BackgroundDark: ViewModifier {
    @Environment(\.colorScheme) var scheme
    func body(content: Content) -> some View {
        content
            .foregroundStyle(scheme == .light ? AnyShapeStyle(.background) : AnyShapeStyle(.foreground))
            .background(scheme == .light ? AnyShapeStyle(.foreground) : AnyShapeStyle(.background))
    }
}
