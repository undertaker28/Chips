//
//  ContentView.swift
//  Chips
//
//  Created by Pavel on 4.12.22.
//

import SwiftUI

struct ContentView: View {
    @State var shouldHide: Bool
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                HStack {
                    Text("Отметьте то, что вам интересно, чтобы настроить Дзен")
                        .font(Font.custom("WorkSans-Regular", size: 16))
                        .padding(EdgeInsets(top: 16, leading: 16, bottom: 8, trailing: 12))
                        .foregroundColor(Color("Title"))
                    Button(action: {}) {
                        Text("Позже")
                            .font(Font.custom("MarkPro-Bold", size: 16))
                            .foregroundColor(Color.white)
                    }
                    .padding(EdgeInsets(top: 11, leading: 13, bottom: 11, trailing: 13))
                    .background(Color("HeaderChip"))
                    .cornerRadius(40)
                }
                ScrollView {
                    TopicChipsView()
                }
                HStack {
                    Spacer()
                    Button(action: {}) {
                        Text("Продолжить")
                            .font(Font.custom("MarkPro-Bold", size: 18))
                            .padding(EdgeInsets(top: 29, leading: 51, bottom: 29, trailing: 51))
                            .foregroundColor(Color.black)
                            .background(Color.white)
                            .cornerRadius(74)
                    }
                    .opacity(shouldHide ? 0 : 1)
                    Spacer()
                }
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: Notification.Name("shouldShowButton")), perform: { _ in
            self.shouldHide = TopicsChipViewModel().shouldShowButton()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(shouldHide: TopicsChipViewModel().shouldShowButton())
    }
}
