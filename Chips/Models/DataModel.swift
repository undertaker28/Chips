//
//  DataModel.swift
//  Chips
//
//  Created by Pavel on 4.12.22.
//

import Foundation

struct DataModel {
    var data = Data.allChips
    
    init(data: [String] = Data.allChips) {
        self.data = data
    }
}
