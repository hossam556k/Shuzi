//
//  NumberDisplay.swift
//  Shuzi
//
//  Created by MacBook Pro on 27/09/2026.
//

import SwiftUI

struct NumberDisplay: View {
    let number: Option
    let showPinyin: Bool
    let onPlayAudio: () -> Void
    let onTogglePinyin: () -> Void
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var isIPad: Bool {
        horizontalSizeClass == .regular && verticalSizeClass == .regular
    }
    
    
    var numberChineseSize: CGFloat {
        Device.isVisionOS ? 160 : 80
        
    }
    var body: some View {
        GroupBox {
            VStack {
                Text(number.chinese)
                    .font(.system(size: numberChineseSize, weight: .bold))
                    .foregroundStyle(
                        LinearGradient(colors: [.indigo, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                
                Text(number.pinyin)
                    .font(.title2)
                    .opacity(showPinyin ? 1 : 0)

                
                Text("What number is this?")


            }
        } label: {
            HStack {
                Button {
                    onTogglePinyin()
                }
                label: {
                    Label("pinyin", systemImage: showPinyin ? "eye" : "eye.slash")
                }
                .font(Device.isVisionOS ? .title3 : .subheadline)
                
                Spacer()
                
                Button {
                    onPlayAudio()
                }
                label: {
                    Image(systemName: "volume.2.fill")
    
                
            }
            }
            .buttonStyle(.borderedProminent)
            .tint(.indigo)
            
        }
      
    }
}

#Preview {
    NumberDisplay(number: Option.one, showPinyin: true, onPlayAudio: { print("Play audio") }, onTogglePinyin: {})
}
