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
                
          
            }
            
            //welcome message
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Welcome back, Maggie!")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("Let's Reflect on Your Day")
                    .font(.headline)
                //Mood graph box
                VStack {
                    HStack {
                        Text("Mood graph")
                            .font(.title3)
                        Spacer()
                        
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray)
                        .frame(height: 200)
                        .shadow(radius: 3)
                        .padding()
                }
                //insights section
                VStack(alignment: .leading) {
                    Text("Today's Insights")
                        .font(.headline)
                        .padding(.leading)
                }

                    HStack(spacing: 16) {
                        Button("View Journal") {}
                        Button("Home Button") {}
                        Button("Create Log +") {}
                        
                        
                    }
                
                Spacer()
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
