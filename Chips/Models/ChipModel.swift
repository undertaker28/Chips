//
//  ChipModel.swift
//  Chips
//
//  Created by Pavel on 4.12.22.
//

import SwiftUI

struct ChipModel: Identifiable {
    let id = UUID()
    @State var isSelected: Bool
    let topicName: String
}
