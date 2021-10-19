//
//  ContentView.swift
//  Brain Training Game
//
//  Created by Giovanni Gaffé on 2021/9/28.
//

import SwiftUI

struct ContentView: View {
    @State private var appCurrentChoice = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    
    @State private var score = 0
    @State private var roundCount = 0
    @State private var alertTitle = ""
    @State private var showingAlert = false
    
    let possibleChoices = ["Rock", "Paper", "Scissors"]
    
    var body: some View {
        VStack {
            Text("App chose \(possibleChoices[appCurrentChoice])")
                .font(.largeTitle)
                .bold()
                .padding()
            
            Text("You should \(shouldWin ? "win" : "lose")")
                .foregroundColor(shouldWin ? .green : .red)
                .font(.title)
                .padding()
            
            HStack {
                Button("Rock") {
                    if possibleChoices[appCurrentChoice] == possibleChoices[2] && shouldWin || possibleChoices[appCurrentChoice] == possibleChoices[1] && !shouldWin {
                        score += 1
                        alertTitle = "You Won :)"
                    } else if possibleChoices[appCurrentChoice] == possibleChoices[0] && shouldWin || possibleChoices[appCurrentChoice] == possibleChoices[0] && !shouldWin {
                        score += 0
                        alertTitle = "We're equal :/"
                    } else {
                        score -= 1
                        alertTitle = "You lost :("
                    }
                    showingAlert = true
                }
                
                Button("Paper") {
                    
                    if possibleChoices[appCurrentChoice] == possibleChoices[0] && shouldWin || possibleChoices[appCurrentChoice] == possibleChoices[2] && !shouldWin {
                        score += 1
                        alertTitle = "You Won :)"
                    } else if possibleChoices[appCurrentChoice] == possibleChoices[1] && shouldWin || possibleChoices[appCurrentChoice] == possibleChoices[1] && !shouldWin {
                        score += 0
                        alertTitle = "We're equal :/"
                    } else {
                        score -= 1
                        alertTitle = "You lost :("
                    }
                    showingAlert = true
                    
                }
                
                Button("Scissors") {
                    if possibleChoices[appCurrentChoice] == possibleChoices[1] && shouldWin || possibleChoices[appCurrentChoice] == possibleChoices[0] && !shouldWin {
                        score += 1
                        alertTitle = "You Won :)"
                    } else if possibleChoices[appCurrentChoice] == possibleChoices[2] && shouldWin || possibleChoices[appCurrentChoice] == possibleChoices[2] && !shouldWin {
                        score += 0
                        alertTitle = "We're equal :/"
                    } else {
                        score -= 1
                        alertTitle = "You lost :("
                    }
                    showingAlert = true
                }
                
            }
            .padding(.bottom, 90)
            
            Text("Player score : \(score) points")
                .font(.title3)
                .padding()
            
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text(alertTitle), message: Text("App choice \(possibleChoices[appCurrentChoice])"), dismissButton: .default(Text("OK")) {
                        nextRound()
                    })
                    
                }
        }
    }
    
    func nextRound() {
        appCurrentChoice = Int.random(in: 0...2)
        shouldWin = Bool.random()
        roundCount += 1
        if roundCount < 11 {
            
        } else {
            roundCount = 0
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
