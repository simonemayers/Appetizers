//
//  XDismissButton.swift
//  Appetizers
//
//  Created by Owner on 5/23/24.
//

import SwiftUI

struct XDismissButton: View {
    var body: some View {
        Image(systemName: "x.circle.fill")
            .frame(width: 44, height: 44)
            .foregroundStyle(.black)
            .opacity(0.4)
            .imageScale(.large)
    }
}

#Preview {
    XDismissButton()
}
