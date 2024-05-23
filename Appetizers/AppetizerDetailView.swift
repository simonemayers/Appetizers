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
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
//                    .padding()
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                HStack(spacing: 30) {
                    VStack(spacing: 5) {
                        Text("Calories")
                            .bold()
                            .font(.caption)
                        Text("\(appetizer.calories)")
                            .foregroundStyle(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                    .padding()
                    VStack(spacing:5) {
                        Text("Carbs")
                            .bold()
                            .font(.caption)
                        Text("\(appetizer.carbs) g")
                            .foregroundStyle(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                    .padding()
                    VStack(spacing: 5) {
                        Text("Protein")
                            .bold()
                            .font(.caption)
                        Text("\(appetizer.protein) g")
                            .foregroundStyle(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                    .padding()
                }
            }
            
            Spacer()
            
            Button {
                
            } label: {
                Text("$\(appetizer.price, specifier: "%.2f") - Add to Order")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(width: 260, height: 50)
                    .foregroundColor(.white)
                    .background(.brandPrimary)
                    .cornerRadius(10)
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
            Image(systemName: "x.circle.fill")
                .frame(width: 44, height: 44)
                .foregroundStyle(.black)
                .opacity(0.4)
                .imageScale(.large)
            
        }, alignment: .topTrailing)
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(true))
}
