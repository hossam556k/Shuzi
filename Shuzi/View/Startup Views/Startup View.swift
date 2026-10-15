//
//  Startup View.swift
//  Shuzi
//
//  Created by MacBook Pro on 21/09/2026.
//

import SwiftUI

struct StartupView: View {
    @State private var vm = StartupViewModel()
    @State private var path: [Destination] = []
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var isIPad: Bool {
        horizontalSizeClass == .regular && verticalSizeClass == .regular
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                //Mark: title
                TitleSectionView(isIPad: isIPad)
                
                Spacer()
                
                
                //Mark: proverb Card
                ProverbCardView(proverbModel: vm.provenModel, isLoading: vm.isLoading, isIPad: isIPad)
                Spacer()
                //Mark: Start Button
                GradinetButton(title: "Start Learning", systemImage: "play.fill", isIPad: false) {
                    path.append(Destination.game)
                }
            }
            .padding()
            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                case .game:
                    GameView(path: $path)
                }
                
            }
            .task {
                await vm.fetchQuote()
                if let provenModel = vm.provenModel {
                    SpeechManager.shared.speakChinese(provenModel.proverb)
                    SpeechManager.shared.speakEnglish(provenModel.translation)
                }
            }
        }
    }
}

#Preview {
    StartupView()
}
