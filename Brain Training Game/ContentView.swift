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
                    let info = beatOpponent()
                    Button("Rock") {
                        print("Rock")
                        textAlert = "Player choose \n rock"
                        if info == "Rock" {
                            print("Success")
                        } else {
                            print("Failure")
                        }
                        showingAlert.toggle()
                    }
                    
                    Button("Paper") {
                        print("Paper")
                        textAlert = "Player choose \n paper"
                        if info == "Rock" {
                            print("Success")
                        } else {
                            print("Failure")
                        }
                        showingAlert.toggle()
                    }
                    
                    Button("Scissors") {
                        print("Scissors")
                        textAlert = "Player choose \n scissors"
                        if info == "Rock" {
                            print("Success")
                        } else {
                            print("Failure")
                        }
 
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
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
