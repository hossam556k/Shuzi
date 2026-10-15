//
//  UiDevice.swift
//  Shuzi
//
//  Created by MacBook Pro on 18/09/2026.
//

import SwiftUI

struct Device {
    static var isVisionOS: Bool {
        #if os(visionOS)
        return true
        #else
        return false
        #endif
    }
}
