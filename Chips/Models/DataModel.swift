//
//  DataModel.swift
//  Chips
//
//  Created by Pavel on 4.12.22.
//

import Foundation

struct DataModel {
    var data = allChips
    
    init(data: [String] = allChips) {
        self.data = data
    }
}
