//
//  ContentView.swift
//  MathTutor
//
//  Created by app-kaihatsusha on 02/01/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var firstNumber: Int = 0
    @State private var secondNumber: Int = 0
    
    @State private var firstNumberEmojis = ""
    @State private var secondNumberEmojis = ""
    
    private let emojis = ["🍕", "🍎", "🍏", "🐵", "👽", "🧠", "🧜🏽‍♀️", "🧙🏿‍♂️", "🥷", "🐶", "🐹", "🐣", "🦄", "🐝", "🦉", "🦋", "🦖", "🐙", "🦞", "🐟", "🦔", "🐲", "🌻", "🌍", "🌈", "🍔", "🌮", "🍦", "🍩", "🍪"]
    
    var body: some View {
        VStack {
            VStack {
                Text(firstNumberEmojis)
                Text("+")
                Text(secondNumberEmojis)
            }
            .font(.system(size: 80))
            .multilineTextAlignment(.center)
            
            Spacer()
            
            Text("\(firstNumber) + \(secondNumber) =")
                .font(.largeTitle)
            let _ = print(firstNumberEmojis)
            let _ = print(secondNumberEmojis)
        }
        .padding()
        .onAppear {
            firstNumber = Int.random(in: 1...10)
            secondNumber = Int.random(in: 1...10)
            
            firstNumberEmojis =  String(repeating: emojis[Int.random(in: 0..<emojis.count)], count: firstNumber)
            secondNumberEmojis =  String(repeating: emojis[Int.random(in: 0..<emojis.count)], count: secondNumber)
            
        }
    }
}

#Preview {
    ContentView()
}
