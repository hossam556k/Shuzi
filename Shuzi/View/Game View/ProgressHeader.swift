//
//  ProgressHeader.swift
//  Shuzi
//
//  Created by MacBook Pro on 27/09/2026.
//

import SwiftUI

struct ProgressHeader: View {
    
    let currentQuestion: Int
    let totalQuestion: Int
    let score: Int
    
    var background: LinearGradient = LinearGradient(
        colors: [.yellow.opacity(0.25), .orange.opacity(0.25)], startPoint: .leading, endPoint: .trailing
    )
    
    var questionColor: Color {
        Device.isVisionOS ? .gray : .secondary
    }
    var body: some View {
        HStack {
            Image(systemName: "trophy.fill")
                .foregroundStyle(.yellow)
            Text("Question \(currentQuestion) of \(totalQuestion)")
                .fontWeight(.semibold)
                .foregroundStyle(questionColor)
            
            Spacer()
            
            HStack(spacing: 4) {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
                Text(" \(score) correct")
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 4)
            .background(background, in: Capsule())
        }
        .padding()
        

    }
}

#Preview {
    ProgressHeader(currentQuestion: 5, totalQuestion: 10, score: 3)
}
