//
//  Option.swift
//  Shuzi
//
//  Created by MacBook Pro on 17/09/2026.
//

import Foundation
struct Option: Identifiable, Equatable {
    let id = UUID()
    let number: Int
    let chinese: String
    let pinyin: String
    
    static let one: Option = .init(number: 1, chinese: "一", pinyin: "Yī")
    static let two: Option = .init(number: 2, chinese: "二", pinyin: "Èr")
    static let three: Option = .init(number: 3, chinese: "三", pinyin: "Sān")
    static let four: Option = .init(number: 4, chinese: "四", pinyin: "Sì")

    
}
