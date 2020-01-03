//
//  ContentView.swift
//  FullScreenModal
//
//  Created by Stewart Lynch on 2020-01-02.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresented = false
    var body: some View {
        ZStack {
            NavigationView {
                Button("Show Modal") {
                    withAnimation {
                        self.isPresented = true
                    }
                }
            .navigationBarTitle("Full Screen Modal")
            }
            FullModal(isPresented: $isPresented) {
                ModalView()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ModalView: View {
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.green)
                .frame(width: 200, height: 200)
            Spacer()
        }
    }
}

struct FullModal<Content:View>: View {
    @Binding var isPresented:Bool
    let modalView: () -> Content
    let thisWindow = UIApplication.shared.windows.filter{$0.isKeyWindow}.first
    var body: some View {
        ZStack {
            Color(UIColor.secondarySystemBackground)
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation {
                            self.isPresented = false
                        }
                    }) {
                        Image(systemName:"xmark.circle.fill")
                    }
                }
                .padding(.horizontal)
                modalView()
            }.padding(.top,thisWindow?.safeAreaInsets.top)
            Spacer()
        }
        .offset(x: 0, y: isPresented ? 0 : thisWindow?.frame.height ?? 0)
        .edgesIgnoringSafeArea(.all)
    }
}
