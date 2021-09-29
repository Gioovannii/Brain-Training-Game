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
                    
                    Button("Rock") {
                        print("Rock")
                    }
                    Button("Paper") {
                        print("Paper")
                    }
                    Button("Scissors") {
                        print("Scissors")
                    }
                }
                .padding()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
