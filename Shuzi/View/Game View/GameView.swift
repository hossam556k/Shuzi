//
//  GameView.swift
//  Shuzi
//
//  Created by MacBook Pro on 26/09/2026.
//

import SwiftUI

struct GameView: View {
    @State private var vm = GameViewModel()
    @AppStorage("showPinyin") private var showPinyin: Bool = true
    
    @Binding var path: [Destination]
    
    var body: some View {
        VStack {
            ProgressBar(currentQuestionn: vm.currentQuestions,
                        totalQuestions: vm.totalQuestions,
                        score: vm.score)
            
            Spacer()
            
            NumberDisplay(number: vm.currentOption, showPinyin: showPinyin) {
                vm.playAudio(vm.currentOption.chinese)
            } onTogglePinyin: {
                showPinyin.toggle()
            }
            
            Spacer()
            
            QuizGrid(
                options: vm.options, onAnswerSelect: vm.selectOption(_:)
            
            )
            .padding()
            .onChange(of: vm.currentOption, { oldValue, newValue in
                vm.playAudio(newValue.chinese)
                
            })
            .onAppear {
                vm.playAudio(vm.currentOption.chinese)
            }
            .sheet(isPresented: $vm.isGameOver) {
                GameOverScreen(score: vm.score, totalQuestions: vm.totalQuestions)
                {
                    vm.resetGame()
                } onGoHome: {
                    vm.resetGame()
                    path = []
                }
                .interactiveDismissDisabled()
             }
        }
    }
}

#Preview {
    GameView(path: .constant([]))
}
