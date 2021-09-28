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
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
