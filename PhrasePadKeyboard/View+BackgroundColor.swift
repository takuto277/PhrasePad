//
//  View+BackgroundColor.swift
//  PhrasePadKeyboard
//
//  Created by 小野拓人 on 2024/08/03.
//

import SwiftUI

extension View {

    func backgroundColor(_ color: UIColor, _ alpha: CGFloat) -> some View {
        background(BackgroundColorView(color: color, alpha: alpha))
    }
}

struct BackgroundColorView: UIViewRepresentable {

    let color: UIColor
    let alpha: CGFloat

    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        Task {
            view.superview?.superview?.backgroundColor = color
            view.alpha = alpha
        }
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}
