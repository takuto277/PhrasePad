//
//  Item.swift
//  PhrasePad
//
//  Created by 小野拓人 on 2024/08/03.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
