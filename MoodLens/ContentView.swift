//
//  ContentView.swift
//  MoodLens
//
//  Created by Disha Maheshwari on 7/29/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20){
            //header
            VStack(spacing: 8) {
                
                Text("MOODLENS")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("Your feelings in full color")
                    .font(.subheadline)
                    .foregroundColor(.black)
                
                Button(action: {}) {
                    Text("Summary")
                        .padding(.horizontal)
                        .padding(.vertical, 6)
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(radius: 2)
                }
                
                //welcome message
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Welcome back, [Name]!")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text("Let's Reflect on Your Day")
                        .font(.headline)
                }
                Spacer()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
