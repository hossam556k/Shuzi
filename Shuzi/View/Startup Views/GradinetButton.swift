//
//  GradinetButton.swift
//  Shuzi
//
//  Created by MacBook Pro on 26/09/2026.
//

import SwiftUI

struct GradinetButton: View {
    let title: String
    let systemImage: String
    let isIPad: Bool
    let action: () -> Void
    let linearGradeint: LinearGradient = LinearGradient(
        colors: [.indigo, .purple],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    var cornerRadius: CGFloat {
        if isIPad {
            return 20
        } else {
          return  Device.isVisionOS ? 30 : 15
        }
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Label (
                title,
                systemImage: systemImage
            )
            .font(isIPad ? .title.bold() : .subheadline.bold())
            .frame(maxWidth: .infinity)
            .padding()
            .foregroundStyle(.white)
        }
        .background(linearGradeint)
        .clipShape(.rect(cornerRadius: cornerRadius))
        .shadow(radius: isIPad ? 5 : 2.5)
        .tint(linearGradeint)
        
    }
}

#Preview {
    GradinetButton(title: "Start Learing", systemImage: "play.fill", isIPad: false) {
        
    }
    .padding()
}
