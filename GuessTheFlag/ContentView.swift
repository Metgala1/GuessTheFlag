//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Atagwe Roger on 28/06/2026.
//

import SwiftUI

struct ContentView: View {
   @State private var countries = ["Estonia", "France" , "Germany" , "Ireland" , "Italy" , "Nigeria" , "Poland" , "Spain" , "UK" , "Ukraine" , "US"].shuffled()
   @State private var correctAnswer = Int.random(in: 0...2)
    @State private var wrongAnswer: Int = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var userScore = 0
    @State private var totalPlay = 8
    @State private var showingGameOver = false
    
    var body: some View {
        ZStack{
            RadialGradient(stops: [.init(color: Color(red: 0.1, green: 0.2, blue: 0.45 ) , location: 0.3), .init(color: Color(red: 0.76 , green: 0.2 , blue: 0.26), location: 0.3)], center: .top , startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            VStack{
                Spacer()
                Text("Guess the flag")
                    .foregroundStyle(.white)
                    .font(.largeTitle.bold())
                VStack(spacing: 15) {
                    VStack{
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .foregroundStyle(.black)
                            .font(.largeTitle.weight(.semibold))
                    }
                    ForEach(0..<3) { number in
                        Button {
                            
                            flagTapped(number)

                        }label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                        }
                        
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical , 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                Spacer()
                Spacer()
                Text("Score \(userScore)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Spacer()
                
            }
            .padding()
            
        }
        .alert((scoreTitle) , isPresented: $showingScore){
            Button("Continue" , action: askQuestion)
        } message: {
            Text("Your score is \(userScore)")
        }
        .alert("Game Over. Your score is \(userScore)", isPresented: $showingGameOver) {
            Button("New Game" , action: resetGame)
        }
     
        }
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            userScore += 1
        } else {
            wrongAnswer = number
            scoreTitle = "Wrong! That's the flag of  \(countries[wrongAnswer])."
        }
      totalPlay -= 1
        if totalPlay == 0 {
            showingGameOver = true
        }else {
            showingScore = true
        }
    }
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    func resetGame() {
        userScore = 0
        totalPlay = 8

        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
 }

#Preview {
    ContentView()
}
