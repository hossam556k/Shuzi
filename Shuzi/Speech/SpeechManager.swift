//
//  SpeechManager.swift
//  Shuzi
//
//  Created by MacBook Pro on 17/09/2026.
//

import Foundation
import AVFoundation

final class SpeechManager {
    static let shared = SpeechManager()
    private let synthesizer = AVSpeechSynthesizer()
    
    private init() {}
    
    enum Language: String {
        case chinese = "zh-US"
        
        case english = "en-US"
    }
    
    func speak(_ text: String, language: Language)  {
        //TODO :
        let utterance = AVSpeechUtterance(string: text)
        utterance.rate = 0.45
        utterance.pitchMultiplier = 0.7
        utterance.volume = 1.0
        
        if let voice = AVSpeechSynthesisVoice(language: language.rawValue) {
            utterance.voice = voice
        } else {
            print("Language \(language.rawValue) voice is not available, using default voice")
        }
        if synthesizer.isSpeaking {
            synthesizer.stopSpeaking(at: .immediate)
        }
        synthesizer.speak(utterance)
    }
    func speakChinese(_ text: String) {
        speak(text, language: .chinese)
    }
    func speakEnglish(_ text: String) {
        speak(text, language: .english)
    }
      
}
