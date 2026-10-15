//
//  TitleSectionView.swift
//  Shuzi
//
//  Created by MacBook Pro on 21/09/2026.
//

import SwiftUI

struct TitleSectionView: View {
    let isIPad: Bool
    let linearGradient: LinearGradient = LinearGradient(colors: [.indigo, .pink], startPoint: .topLeading, endPoint: .bottomTrailing)
    var body: some View {
        VStack {
            Text("数")
                .font(
                    .system(
                        size: isIPad ? 160 :80,
                    weight: .bold
                    ))
                .padding()
                .background(linearGradient)
                .clipShape(Circle())
                .foregroundStyle(.white)
                .shadow(radius: isIPad ? 10 : 5)
            Text("Chinese Number")
                .font(isIPad ? .largeTitle.bold() : .title.bold())
            Text("Learn numbers the fun way!")
                .font(isIPad ? .title2 : .subheadline)
                .foregroundStyle(.secondary)
        }.multilineTextAlignment(.center)
    }
}

#Preview {
    VStack {
        TitleSectionView(isIPad: true)
        
        Spacer()

    }
}


#Preview {
    VStack {
        TitleSectionView(isIPad: false)
        
        Spacer()

    }
}
