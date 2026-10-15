//
//  ProgressBar.swift
//  Shuzi
//
//  Created by MacBook Pro on 26/09/2026.
//

import SwiftUI

struct ProgressBar: View {
    let currentQuestionn: Int
    let totalQuestions: Int
    let score: Int
    
    var progress: CGFloat {
        totalQuestions > 0 ? CGFloat(currentQuestionn) / CGFloat(totalQuestions) : 0
    }
    
    var scorePercentage: CGFloat {
        currentQuestionn > 1 ? CGFloat(score) / CGFloat(currentQuestionn-1) : 0
    }
    
    @State private var isAnimated = false
    
    let thickness = 10.0
    
    var body: some View {
        
        VStack {
          ProgressHeader(currentQuestion: currentQuestionn, totalQuestion: totalQuestions, score: score)
            ZStack {
                Capsule()
                    .fill(.secondary.opacity(0.2))
                    .frame(height: 10)
                ProgressView(value: isAnimated ?  progress : 0)
                    .progressViewStyle(
                        CustomProgressViewStyle(colors: [.mint, .teal], thickness: thickness)
                    )
                ProgressView(value: isAnimated ? scorePercentage : 0)
                    .progressViewStyle(
                        CustomProgressViewStyle(
                            colors: [
                                .yellow.opacity(0.6),
                                .orange.opacity(0.6)
                            ]
                        )
                    )
                
                  
            }
        }
        .padding()
        .background(
            .white.opacity(0.85)
        )
        .clipShape(.rect(cornerRadius: 25))
        .shadow(radius: 6)
        .onAppear {
            isAnimated = true
        }
    }
}

struct CustomProgressViewStyle: ProgressViewStyle {
    var colors: [Color]
    var thickness: CGFloat = 10.0
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .leading) {
            Capsule()
                .fill(
            LinearGradient(
                colors: colors, startPoint: .leading, endPoint: .trailing
                )
            )
                .scaleEffect(x: configuration.fractionCompleted ?? 0,
                    anchor: .leading)
                .animation(.easeOut, value: configuration.fractionCompleted)
        }
        .frame(height: thickness)
        .clipShape(Capsule())
    }
}

#Preview {
    ProgressBar(
        currentQuestionn: 9,
        totalQuestions: 10,
        score: 3
    )
    .padding()
}
