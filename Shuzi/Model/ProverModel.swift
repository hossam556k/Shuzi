//
//  ProverModel.swift
//  Shuzi
//
//  Created by MacBook Pro on 17/09/2026.
//

import Foundation
struct ProverModel: Codable {
    let id: String
    let proverb: String
    let pinyin: String
    let translation: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case proverb = "proverb"
        case pinyin = "pinyin"
        case translation = "translation"
    }
        static func defaultQuote() -> ProverModel {
            .init(id: "63e6ae053bd28e8c186fdf98", proverb: "书到用时方恨少。", pinyin: "Shū dào yòng shí fāng hèn shǎo", translation: "When using books, you'll regret reading few.")
    }
}
