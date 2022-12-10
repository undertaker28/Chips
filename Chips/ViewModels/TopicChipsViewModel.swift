//
//  TopicChipsViewModel.swift
//  Chips
//
//  Created by Pavel on 4.12.22.
//

import SwiftUI

class TopicChipsViewModel: ObservableObject {
    @Published var chips: [ChipModel] = []
    let userDefaults = UserDefaults.standard
    
    init() {
        initChips()
    }
    
    func initChips() {
        let selectedChips: [String: Int] = userDefaults.object(forKey: "selectedChips") as? [String: Int] ?? [:]
        var isSelected: Bool
        for (index, chip) in DataModel().data.enumerated() {
            isSelected = selectedChips["\(chip)\(index)"] != nil
            chips.append(ChipModel(isSelected: isSelected, topicName: chip))
        }
    }
    
    func addChip(topicName: String, id: Int) {
        var selectedChips: [String: Int] = userDefaults.object(forKey: "selectedChips") as? [String: Int] ?? [:]
        selectedChips["\(topicName)\(id)"] = id
        userDefaults.set(selectedChips, forKey: "selectedChips")
    }
    
    func removeChip(id: Int) {
        var selectedChips: [String: Int] = userDefaults.object(forKey: "selectedChips") as? [String: Int] ?? [:]
        for (key, value) in selectedChips {
            if value == id {
                selectedChips[key] = nil
                userDefaults.set(selectedChips, forKey: "selectedChips")
                break
            }
        }
    }
    
    func shouldShowButton() -> Bool {
        let selectedChips: [String: Int] = userDefaults.object(forKey: "selectedChips") as? [String: Int] ?? [:]
        return selectedChips.isEmpty
    }
}
