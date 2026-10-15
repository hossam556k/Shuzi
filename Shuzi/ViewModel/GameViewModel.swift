//
//  GameViewModel.swift
//  Shuzi
//
//  Created by MacBook Pro on 19/09/2026.
//

import Foundation
@Observable

class GameViewModel{
    var currentOption: Option = GameData.randomOption()
    var options: [Option] = []
    var currentQuestions = 1
    var score = 0
    var isGameOver =  false
    
    var totalQuestions: Int  = 10
    
    init(totalQuestions: Int = 10) {
        self.totalQuestions = totalQuestions
        generateOptions()
    }
    
    func generateOptions() {
        let correct = currentOption
        var wrong: [Option] = []
        while wrong.count < 3 {
            let randomOption = GameData.randomOption()
            if randomOption != correct && !wrong.contains(randomOption) {
                wrong.append(randomOption)
            }
        }
        options = (wrong + [correct]).shuffled()
    }
    
    func nextQuestion() {
        if currentQuestions >= totalQuestions {
            isGameOver = true
        } else {
            currentQuestions += 1
            currentOption = GameData.randomOption()
            generateOptions()
        }
    }
    
    func selectOption(_ selected: Option)  {
        let isCorrect = selected == currentOption
        if isCorrect {
            score += 1
        }
        nextQuestion()
    }
    
    func resetGame() {
        score = 0
        currentQuestions = 1
        isGameOver = false
        currentOption = GameData.randomOption()
        generateOptions()
    }
    
    func playAudio(_ text: String) {
        SpeechManager.shared.speakChinese(text)
    }
    
}

