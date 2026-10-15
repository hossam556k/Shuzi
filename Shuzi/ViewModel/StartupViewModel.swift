//
//  StartupViewModel.swift
//  Shuzi
//
//  Created by MacBook Pro on 19/09/2026.
//

import Foundation
@Observable
@MainActor
class StartupViewModel {
    var provenModel: ProverModel?
    
    var isLoading = true
    var navigationToGame = false
    
    private let urlString = "https://chinese-proverbs.onrender.com/api/proverbs/random"
    
    func fetchQuote()  async {
        isLoading = true
        defer { isLoading = false }
        
        guard let url = URL(string: urlString) else {
            provenModel = ProverModel.defaultQuote()
            print("Invaild URL, using defult qoute")
            return
        }
        do {
            var request = URLRequest(url: url)
            let (data, _) = try await URLSession.shared.data(for: request)
            let newProvenModel = try JSONDecoder().decode(ProverModel.self, from: data)
            
            provenModel = newProvenModel
            
        } catch {
            print("Failed to fetch qoute, using default. Error", error)
            provenModel = ProverModel.defaultQuote()
        }
    }
}
