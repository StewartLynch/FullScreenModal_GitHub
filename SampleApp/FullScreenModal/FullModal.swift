//
//  FullModal.swift
//  FullScreenModal
//
//  Created by Stewart Lynch on 2020-01-02.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

import SwiftUI

struct FullModal<Content:View>: View {
    @Binding var isPresented:Bool
    var backgroundColor:UIColor?
    var buttonColor:UIColor?
    let modalView: () -> Content
    let thisWindow = UIApplication.shared.windows.filter{$0.isKeyWindow}.first
    var body: some View {
        ZStack {
            Color((backgroundColor == nil ?  UIColor.secondarySystemBackground : backgroundColor)!)
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation {
                            self.isPresented = false
                        }
                    }) {
                        Image(systemName:"xmark.circle.fill")
                            .foregroundColor(buttonColor == nil ? Color(UIColor.blue) : Color(buttonColor!))
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
