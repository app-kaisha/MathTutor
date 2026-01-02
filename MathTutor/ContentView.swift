//
//  ContentView.swift
//  MathTutor
//
//  Created by app-kaihatsusha on 02/01/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    
    @State private var firstNumber: Int = 0
    @State private var secondNumber: Int = 0
    @State private var firstNumberEmojis = ""
    @State private var secondNumberEmojis = ""
    @State private var answer: String = ""
    @State private var audioPlayer: AVAudioPlayer!
    @State private var textfieldDisabled = false
    @State private var guessButtonDisabled = false
    @State private var message = ""
    
    @FocusState private var isTextfieldFocused: Bool
    
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
                .focused($isTextfieldFocused)
                .frame(width: 60)
                
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.gray, lineWidth: 2)
                }
                .disabled(textfieldDisabled)
            
            Button("Guess") {
                isTextfieldFocused = false
                
                guard let answerValue = Int(answer) else {
                    return
                }
                
                if answerValue == (firstNumber + secondNumber) {
                    playSound(soundName: "correct")
                    message = "Correct!"
                } else {
                    playSound(soundName: "wrong")
                    message = "Sorry, the correct answer is \(firstNumber + secondNumber)!"
                }
                textfieldDisabled = true
                guessButtonDisabled = true
            }
            .buttonStyle(.borderedProminent)
            .disabled(answer.isEmpty || guessButtonDisabled)
            
            Spacer()
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.black)
                .multilineTextAlignment(.center)
                .foregroundStyle(message == "Correct!" ? .green : .red)
                .frame(height: 100)
                .minimumScaleFactor(0.5)
        }
        .padding()
        .onAppear {
            firstNumber = Int.random(in: 1...10)
            secondNumber = Int.random(in: 1...10)
            
            firstNumberEmojis =  String(repeating: emojis[Int.random(in: 0..<emojis.count)], count: firstNumber)
            secondNumberEmojis =  String(repeating: emojis[Int.random(in: 0..<emojis.count)], count: secondNumber)
            
        }
    }
    
    func playSound(soundName: String) {
        
        if audioPlayer != nil && audioPlayer.isPlaying {
            audioPlayer.stop()
        }
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("😡 Could not read file named \(soundName)")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("😡 ERROR: \(error.localizedDescription) creating audioPlayer.")
        }
    }
}

#Preview {
    ContentView()
}
