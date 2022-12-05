//
//  ContentView.swift
//  Chips
//
//  Created by Pavel on 4.12.22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var topicsChipViewModel = TopicsChipViewModel()
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                HStack {
                    Text("Отметьте то, что вам интересно, чтобы настроить Дзен")
                        .padding(EdgeInsets(top: 16, leading: 16, bottom: 8, trailing: 12))
                        .foregroundColor(Color("Title"))
                    Button(action: {}) {
                        Text("Позже")
                            .font(.system(size: 16))
                            .foregroundColor(Color.white)
                    }
                    .padding(EdgeInsets(top: 11, leading: 13, bottom: 11, trailing: 13))
                    .background(Color("HeaderChip"))
                    .cornerRadius(40)
                }
                ScrollView {
                    TopicsChipView(topicsChipViewModel: topicsChipViewModel)
                }
                HStack {
                    Spacer()
                    Button(action: {}) {
                        Text("Продолжить")
                            .bold()
                            .font(.system(size: 18))
                            .padding(EdgeInsets(top: 29, leading: 51, bottom: 29, trailing: 51))
                            .foregroundColor(Color.black)
                            .background(Color.white)
                            .cornerRadius(74)
                    }
                    Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
