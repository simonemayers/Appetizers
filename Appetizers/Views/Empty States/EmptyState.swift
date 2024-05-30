//
//  EmptyState.swift
//  Appetizers
//
//  Created by Owner on 5/29/24.
//

import SwiftUI

struct EmptyState: View {
    
    let imageName: String
    let message: String
    
    
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea()
            VStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                    .foregroundStyle(.brandPrimary)
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding()
            }
            .offset(y:-50)
        }
    }
}

#Preview {
    EmptyState(imageName: "exclamationmark.bubble.fill", message: "This is our test message. \nI'm making it a little long for testing.")
}
