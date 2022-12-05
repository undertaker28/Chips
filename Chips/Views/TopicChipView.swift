//
//  TopicChipView.swift
//  Chips
//
//  Created by Pavel on 5.12.22.
//

import SwiftUI

struct TopicChipView: View {
    let titleKey: String
    @State var isSelected: Bool
    var body: some View {
        HStack {
            Text(titleKey)
                .font(.system(size: 16))
                .foregroundColor(Color.white)
            HStack {
                Divider()
                    .frame(height: 20)
                    .overlay(Color("Divider"))
                    .opacity(isSelected ? 0 : 1)
                Image(systemName: isSelected ? "checkmark" : "plus")
                    .font(.system(size: 18))
                    .foregroundColor(Color.white)
            }
            .padding(.leading, 6)
        }
        .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 8))
        .background(isSelected ? Color("TopicChipSelected") : Color("TopicChipNotSelected"))
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(lineWidth: 0)
        ).onTapGesture {
            isSelected.toggle()
        }
        .animation(.easeInOut, value: isSelected)
    }
}

struct TopicChipView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            TopicChipView(titleKey: "Юмор", isSelected: false)
        }
    }
}
