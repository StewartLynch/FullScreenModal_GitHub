//
//  ModalView.swift
//  FullScreenModal
//
//  Created by Stewart Lynch on 2020-01-02.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

import SwiftUI

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


struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
    }
}

