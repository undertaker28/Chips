//
//  ChipsApp.swift
//  Chips
//
//  Created by Pavel on 4.12.22.
//

import SwiftUI

@main
struct ChipsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(shouldHide: TopicsChipViewModel().shouldShowButton())
        }
    }
}
