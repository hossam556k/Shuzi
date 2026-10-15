//
//  ShuziApp.swift
//  Shuzi
//
//  Created by MacBook Pro on 17/09/2026.
//

import SwiftUI
import CoreData

@main
struct ShuziApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            StartupView()
        }
    }
}
