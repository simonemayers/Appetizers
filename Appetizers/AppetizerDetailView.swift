//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Owner on 5/23/24.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    let appetizer: Appetizer
    
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack{
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            VStack{
                AppetizerTitle(name: appetizer.name)

                AppetizerDescription(description: appetizer.description)

                HStack(spacing: 30) {
                    NutritionInfo(title: "Calories", value: 99)
                    NutritionInfo(title: "Carbs", value: 99)
                    NutritionInfo(title: "Protein", value: 99)
                }
            }
            
            Spacer()
            
            Button {
                
            } label: {
                APButton(title: "$\(appetizer.price, specifier: "%.2f") - Add to Order")
            }
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetail = false
        } label: {
            XDismissButton()
        }, alignment: .topTrailing)
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(true))
}

struct NutritionInfo: View {
    
    let title: String
    
    let value: Int
    
    var body: some View {
        VStack(spacing: 5) {

            Text(title)
                .bold()
                .font(.caption)

            Text("\(value)")
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

struct AppetizerDescription: View {
    let description: String
    var body: some View {
        Text(description)
            .multilineTextAlignment(.center)
            .font(.body)
            .padding()
    }
}

struct AppetizerTitle: View {
    let name: String
    
    var body: some View {
        Text(name)
            .font(.title2)
            .fontWeight(.semibold)
    }
}
