//
//  ProverbCardView.swift
//  Shuzi
//
//  Created by MacBook Pro on 26/09/2026.
//

import SwiftUI

struct ProverbCardView: View {
    let proverbModel: ProverModel?
    let isLoading: Bool
    let isIPad: Bool
    
    var body: some View {
        GroupBox {
            VStack {
                Divider()
                if  isLoading {
                    ProgressView("Welcome!")
                        .controlSize(.regular)
                        .tint(.indigo)
                        .padding()
                        .padding(.vertical, 8)
                } else if let proverbModel {
                   ProverbContentView(proverModel: proverbModel, isIPad: isIPad)
                } else {
                    Text("No proverb avaiable")
                        .font(isIPad ? .headline : .callout)
                }
                
            }
            
        } label: {
            Label(
                "Daily Wisdom",
                systemImage: "wand.and.sparkles"
            )
            .font(.headline)
            .foregroundStyle(.indigo)
        }
        .padding(.horizontal)
    }
}

#Preview {
    ProverbCardView(proverbModel: ProverModel.defaultQuote(), isLoading: false, isIPad: false)
}
