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
    
    @State private var answer: String = ""
    
    private let emojis = ["🍕", "🍎", "🍏", "🐵", "👽", "🧠", "🧜🏽‍♀️", "🧙🏿‍♂️", "🥷", "🐶", "🐹", "🐣", "🦄", "🐝", "🦉", "🦋", "🦖", "🐙", "🦞", "🐟", "🦔", "🐲", "🌻", "🌍", "🌈", "🍔", "🌮", "🍦", "🍩", "🍪"]
    
    var body: some View {
        VStack {
            Group {
                Text(firstNumberEmojis)
                Text("+")
                Text(secondNumberEmojis)
            }
            .font(.system(size: 80))
            .multilineTextAlignment(.center)
            .minimumScaleFactor(0.5)
            
            Spacer()
            
            Text("\(firstNumber) + \(secondNumber) =")
                .font(.largeTitle)
            
            TextField("", text: $answer)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .frame(width: 60)
                
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.gray, lineWidth: 2)
                }
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
