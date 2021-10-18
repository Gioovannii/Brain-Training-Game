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

    @State private var userChoice = 1
    @State private var playerScore = 0
    
    let possibleChoices = ["Rock", "Paper", "Scissors"]
    
    
    
    
    var body: some View {
            VStack {
                Text("Question \(questionNumber)/10")
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
                        Button("\(possibleChoices[number])") {
                            showStatus = true
                            beatOpponent(appNumber: AppMove, userNumber: number)
                            if shouldWin {
                                playerScore += 1
                            }
                        }.disabled(gameCount >= 10 || buttonStatus)
                    }
                }
                .padding()
                
                HStack {
                    Button("Reset") {
                        shouldWin = false
                        playerScore = 0
                        gameCount = 0
                        buttonStatus = false
                        showEndGame = false
                    }
                    
                    Button("Next") {
                        showEndGame = gameCount >= 10
                        if gameCount < 10 {
                            gameCount += 1
                            questionNumber += 1
                            newRound()
                            buttonStatus = false
                        }
                    }.alert(isPresented: $showEndGame) {
                        Alert(title: Text("Game end"), message: Text("Your final score: \(playerScore)"), dismissButton: .default(Text("OK")) {
                            questionNumber = 0
                            gameCount = 0
                        })
                    }
                }.frame(width: 320, height: 40, alignment: .center)
        }
    }
    
    private func beatOpponent(appNumber: Int, userNumber: Int) {
        if self.gameCount >= 10 {
            showStatus = false
            return
        }
        buttonStatus = true
        
        switch AppMove {
        case 0:
            if userNumber == 1 {
                shouldWin = true
            } else {
                shouldWin = false
            }
        case 1:
            if userNumber == 2 {
                shouldWin = true
            } else {
                shouldWin = false
            }
        default:
            if userNumber == 0 {
                shouldWin = true
            } else {
                shouldWin = false
            }
        }
    }
    
    func newRound() {
        appCurrentChoice = Int.random(in: 0...2)
        shouldWin = Bool.random()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
