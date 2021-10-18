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
            Text("App chose \(possibleChoices[appCurrentChoice])")
                .font(.largeTitle)
                .bold()
                .padding()
            
            if shouldWin { Text("You should win")
                    .font(.title)
                    .padding()
                    .foregroundColor(.green)
            } else { Text("You should lose")
                    .font(.title)
                    .padding()
                    .foregroundColor(.red)
            }
            
            HStack {
                ForEach(possibleChoices, id: \.self) { name in
                    
                    Button("\(name)") {
                        print("User pressed \(name)")
                        beatOponent(userChoice: name, appChoice: appCurrentChoice)
                    }
                    .font(.headline)
                }
                .padding()
                
            }
            .padding(.bottom, 90)
            
            Text("Player score : \(playerScore) points")
                .font(.title3)
                .padding()
        }
    }
    
    func beatOponent(userChoice: String, appChoice: Int) {
        switch appChoice {
        case 0:
            if shouldWin && userChoice == "Scissors" {
                print("Player was trying to win. App chose \(possibleChoices[appCurrentChoice]) and player choose \(userChoice)")
                playerScore += 1
            } else if !shouldWin && userChoice == "Paper" {
                print("Player was trying to lose. App chose \(possibleChoices[appCurrentChoice]) and player choose \(userChoice)")
                playerScore += 1
            } else {
                newRound()
            }
        case 1:
            if shouldWin && userChoice == "Rock" {
                print("Player was trying to win. App chose \(possibleChoices[appCurrentChoice]) and player choose \(userChoice)")
                playerScore += 1
            } else if !shouldWin && userChoice == "Paper" {
                print("Player was trying to lose. App chose \(possibleChoices[appCurrentChoice]) and player choose \(userChoice)")
                playerScore += 1
            } else {
                newRound()
            }
        case 2:
            if shouldWin && userChoice == "Paper" {
                print("Player was trying to win. App chose \(possibleChoices[appCurrentChoice]) and player choose \(userChoice)")
                playerScore += 1
            } else if !shouldWin && userChoice == "Rock" {
                print("Player was trying to lose. App chose \(possibleChoices[appCurrentChoice]) and player choose \(userChoice)")
                playerScore += 1
            } else {
                newRound()
            }
            
        default:
            fatalError()
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
