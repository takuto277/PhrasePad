//
//  BlinkEffect.swift
//  PhrasePad
//
//  Created by 小野拓人 on 2024/08/04.
//

import SwiftUI

// 点滅機能
struct BlinkEffect: ViewModifier {
    @State var isOn: Bool = false
    let opacityRange: ClosedRange<Double>
    let interval: Double
    
    init(opacityRange: ClosedRange<Double>, interval: Double) {
        self.opacityRange = opacityRange
        self.interval = interval
    }
    
    func body(content: Content) -> some View {
        content
            .opacity(self.isOn ? self.opacityRange.lowerBound : self.opacityRange.upperBound)
            .animation(.linear(duration: self.interval).repeatForever(), value: self.isOn)
            .onAppear(perform: {
                self.isOn = true
            })
    }
}
