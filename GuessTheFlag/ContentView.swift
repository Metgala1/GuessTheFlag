//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Atagwe Roger on 28/06/2026.
//

import SwiftUI

struct ContentView: View {
   var countries = ["Estonia", "France" , "Germany" , "Ireland" , "Italy" , "Nigeria" , "Poland" , "Spain" , "UK" , "Ukrain" , "US"]
    var correctAnswer = Int.random(in: 0...2)
    var body: some View {
        ZStack{
            Color.blue
                .ignoresSafeArea()
            VStack(spacing: 30) {
                VStack{
                    Text("Tap the flag of")
                        .foregroundStyle(.white)
                    Text(countries[correctAnswer])
                        .foregroundStyle(.white)
                }
                ForEach(0..<3) { number in
                    Button {
                        //flag was tapped
                    }label: {
                        Image(countries[number])
                    }
                }
            }
        }
     
        }
    
    
 }

#Preview {
    ContentView()
}
