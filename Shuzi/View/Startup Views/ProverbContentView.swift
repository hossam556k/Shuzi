//
//  ProverbContentView.swift
//  Shuzi
//
//  Created by MacBook Pro on 26/09/2026.
//

import SwiftUI

struct ProverbContentView: View {
    let proverModel: ProverModel
    let isIPad: Bool
    var body: some View {
        VStack(spacing: isIPad ? 12 : 8) {
            VStack {
                Text("\(proverModel.proverb)")
                    .font(isIPad ? .title : .title3)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.primary)
                    .onTapGesture {
                        SpeechManager.shared.speakChinese(proverModel.proverb)
                    }
                Text(proverModel.pinyin)
                    .font(isIPad ? .title2 : .headline)
                    .foregroundStyle(.secondary)
            }
            Text(proverModel.translation)
                .font(isIPad ? .title2 : .headline)
                .foregroundStyle(.secondary)
                .onTapGesture {
                    SpeechManager.shared.speakEnglish(proverModel.translation)
                }
        }
        .multilineTextAlignment(.center)
        .frame(maxWidth: .infinity)
        .padding()
    }
}

#Preview {
    ProverbContentView(proverModel: ProverModel.defaultQuote(), isIPad: false)
}
