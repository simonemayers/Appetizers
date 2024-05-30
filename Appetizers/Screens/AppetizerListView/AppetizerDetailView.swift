//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Owner on 5/23/24.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    @EnvironmentObject var order: Order
    
    let appetizer: Appetizer
    
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                image.StandardImageStyle()
                    .frame(width: 300, height: 225)
            } placeholder: {
                Image(systemName: "fork.knife.fill").StandardImageStyle()
                    .frame(width: 300, height: 225)
            }
                
            VStack{
                AppetizerTitle(name: appetizer.name)

                AppetizerDescription(description: appetizer.description)

                HStack(spacing: 30) {
                    NutritionInfo(title: "Calories", value: "\(appetizer.calories)")
                    NutritionInfo(title: "Carbs", value: "\(appetizer.carbs) g")
                    NutritionInfo(title: "Protein", value: "\(appetizer.protein) g")
                }
            }
            
            Spacer()
            
            Button {
                order.add(appetizer)
                isShowingDetail = false
            } label: {
                Text("$\(appetizer.price, specifier: "%.2f") - Add to Order")
            }
            .modifier(StandardButtonStyle())
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
    
    let value: String
    
    var body: some View {
        VStack(spacing: 5) {

            Text(title)
                .bold()
                .font(.caption)

            Text(value)
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
