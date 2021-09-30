//
//  ContentView.swift
//  Brain Training Game
//
//  Created by Giovanni Gaffé on 2021/9/28.
//

import SwiftUI

struct ContentView: View {
    let possibleChoices = ["Rock", "Paper", "Scissors"]
    @State private var shouldWin = false
    @State private var showStatus = false
    @State private var AppMove = Int.random(in: 0 ... 2)
    @State private var playerScore = 0
    @State private var gameCount = 0
    @State private var buttonStatus = false
    @State private var showEndGame = false
    
    
    var body: some View {
            VStack {
                Text("Your score is \(playerScore) points")
                    .padding()
                    .font(.largeTitle)
                Text("App move is \(possibleChoices[AppMove])")
                    .padding()
                    .font(.title)
                
                if showStatus {
                    Text("You \(shouldWin ? "win" : "lose")")
                        .foregroundColor(.red)
                }
                
                HStack {
                    ForEach(0 ..< 3) { number in
                        Button("\(self.possibleChoices[number])") {
                            self.showStatus = true
                            self.beatOpponent(appNumber: self.AppMove, userNumber: number)
                            if self.shouldWin {
                                self.playerScore += 1
                            }
                        }.disabled(self.gameCount >= 10 || self.buttonStatus)
                    }
                }
                .padding()
            }
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Information"), message: Text(textAlert), dismissButton: .default(Text("Continue")))
        }
    }
    
    func beatOpponent() -> String {
        let isWinning = shouldWin
        var playerMove = ""
        
        if isWinning {
            playerMove = possibleChoices[appCurrentChoice + 1]
            print("Player move is wining => \(playerMove)")
        } else if playerMove == possibleChoices[appCurrentChoice] {
            playerMove
        } else {
            playerMove = possibleChoices[appCurrentChoice - 1]
            print("Player move is losing => \(playerMove)")
        }
        return playerMove
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
