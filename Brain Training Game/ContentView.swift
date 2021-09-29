//
//  ContentView.swift
//  Brain Training Game
//
//  Created by Giovanni Gaffé on 2021/9/28.
//

import SwiftUI

struct ContentView: View {
    let possibleChoices = ["Rock", "Paper", "Scissors"]
    @State private var appCurrentChoice = Int.random(in: 0 ..< 2)
    @State private var shouldWin = Bool.random()
    @State private var playerScore = 0
    @State private var textAlert = ""
    @State private var showingAlert = false
    
    var body: some View {
        let beatOponent = beatOpponent()
        ZStack {
            //            LinearGradient(colors: [.blue, .green, .purple], startPoint: .top, endPoint: .bottom)
            //                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Player score \(playerScore) points")
                    .padding()
                Text("App move is \(possibleChoices[appCurrentChoice])")
                    .padding()
                
                if shouldWin {
                    Text("You should win")
                        .padding()
                } else {
                    Text("Yous should loose")
                        .padding()
                }
                
                Group {
                    Button("Rock") {
                        print("Rock")
                        textAlert = "Player choose \n rock"
                        print(beatOponent)
                        showingAlert.toggle()
                    }
                    
                    Button("Paper") {
                        print("Paper")
                        textAlert = "Player choose \n paper"
                        print(beatOponent)
                        showingAlert.toggle()
                    }
                    
                    Button("Scissors") {
                        print("Scissors")
                        textAlert = "Player choose \n scissors"
                        print(beatOponent)
                        showingAlert.toggle()
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
