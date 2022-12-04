//
//  ChipsViewModel.swift
//  Chips
//
//  Created by Pavel on 4.12.22.
//

import SwiftUI

class ChipsViewModel: ObservableObject {
    @Published var chips: [ChipModel] = []
    
    init() {
        initDataObject()
    }
    
    func initDataObject() {
        for chip in DataModel().data {
            chips.append(ChipModel(isSelected: false, titleKey: chip))
        }
    }
}
