//
//  QuizGrid.swift
//  Shuzi
//
//  Created by MacBook Pro on 27/09/2026.
//

import SwiftUI

struct QuizGrid: View {
    let options: [Option]
    let onAnswerSelect: (Option) -> Void
    var body: some View {
        LazyVGrid(columns: [ GridItem(), GridItem() ], spacing: 16) {
            ForEach(options) { option in
                Button {
                    onAnswerSelect(option)
                } label: {
                    Text("\(option.number)")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity)
                }
                .background(.blue.opacity(0.2))
                .clipShape(.rect(cornerRadius: 20))
                .shadow(radius: 5)
                
            }
        }
    }
}

#Preview {
    QuizGrid(options: [Option.one, Option.two, Option.three, Option.four], onAnswerSelect: { _ in })
        .padding()
}
