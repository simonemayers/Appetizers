//
//  LoadingView.swift
//  Appetizers
//
//  Created by Owner on 5/23/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            
            Color(.systemBackground)
                .ignoresSafeArea()
         
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .brandPrimary))
                .scaleEffect(2)
        }
    }
}
