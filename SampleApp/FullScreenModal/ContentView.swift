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
            
            FullModal(isPresented: $isPresented,
                      backgroundColor: .red, buttonColor: .white) {
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


