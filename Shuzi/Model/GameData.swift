//
//  GameData.swift
//  Shuzi
//
//  Created by MacBook Pro on 17/09/2026.
//

import Foundation

struct GameData {
    static let allOptions: [Option] = (1...99).map { num in
    
            .init(number: num, chinese: chinese(for: num), pinyin: pinyin(for: num))
    }
    
    static func chinese(for num: Int) -> String {
        
        let digits = ["", "一","二","三","四","五","六","七","八","九"]
        if num <= 10 {
            return num == 10 ? "十" : digits[num]
        } else if num < 20 {
            return "十" + digits[num % 10]
        } else {
            let tens = digits[num / 10]
            let ones = digits[num % 10]
            return tens + "十" + ones
        }
    }
    
    static func randomOption() -> Option {
        GameData.allOptions.randomElement() ?? Option.one
    }
    
    static func pinyin(for num: Int) -> String {
        let digits = ["","Yī","Èr","Sān","Sì","Wǔ","Liù","Qī","Bā","Jiǔ"]
        if num <= 10 {
            return num == 10 ? "shi" : digits[num]
        } else if num < 20 {
            return "shi" + digits[num % 10]
        } else {
            let tens = digits[num / 10]
            let ones = digits[num % 10]
            return tens + "shi" + ones
        }
    }
    }
    

