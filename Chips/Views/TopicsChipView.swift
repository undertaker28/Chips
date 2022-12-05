//
//  TopicsChipView.swift
//  Chips
//
//  Created by Pavel on 5.12.22.
//

import SwiftUI

struct TopicsChipView: View {
    @ObservedObject var viewModel = ChipsViewModel()
    var body: some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        return GeometryReader { geo in
            ZStack(alignment: .topLeading, content: {
                ForEach(viewModel.chips) { chipsData in
                    TopicChipView(titleKey: chipsData.titleKey,
                                  isSelected: chipsData.isSelected)
                    .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 8))
                    .alignmentGuide(.leading) { dimension in
                        if (abs(width - dimension.width) > geo.size.width) {
                            width = 0
                            height -= dimension.height
                        }
                        
                        let result = width
                        width = chipsData.id == viewModel.chips.last!.id ? 0 : width - dimension.width
                        return result
                    }
                    .alignmentGuide(.top) { dimension in
                        let result = height
                        if chipsData.id == viewModel.chips.last!.id {
                            height = 0
                        }
                        return result
                    }
                }
            })
        }.padding(EdgeInsets(top: 4, leading: 16, bottom: 16, trailing: 12))
    }
}

struct TopicsChipView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            TopicsChipView()
        }
    }
}