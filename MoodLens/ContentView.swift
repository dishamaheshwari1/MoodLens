//
//  ContentView.swift
//  MoodLens
//
//  Created by Maggie Le on 7/29/25.
//

import SwiftUI

struct ContentView: View {
   
    
    var body: some View {
        VStack(spacing: 20){
            //header
            NavigationStack {
            VStack(spacing: 16) {
                

                    Text("MOODLENS")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color("BlueColorText"))
               
                    Text("Your feelings in full color")
                        .font(.subheadline)
                    
                
                    Divider()

                
            }
            .background(Color.accentColor)
            
                //welcome message
            Spacer()
            VStack(alignment: .leading, spacing: 20) {
                Text("Welcome back, [NAME]!")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("Let's Reflect on Your Day")
                    .font(.headline)
                //Mood graph box
                VStack {
                    HStack {
                        Text("Mood graph")
                            .font(.title3)
                            .fontWeight(.semibold)
                    Spacer()
                        NavigationLink(destination: MoodGrid()) {
                            Text(">")
                                .font(.title2)
                                .foregroundColor(Color.blue)
                                
                        }
                
                        }
                        Spacer()
                        
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    
                    RoundedRectangle(cornerRadius: 10)
                    .fill(Color("PastelGreen"))
                        .frame(height: 200)
                        .shadow(radius: 3)
                        .padding()
                }
                //insights section
                
                VStack(spacing: 8) {
                    Text("Emotional Insights")
                        .font(.headline)
                        .padding(.leading)
                    
                    HStack {
                       
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("PastelPink"))
                            Text("Recognize your own emotional state to see how it affects your daily life")
                                .multilineTextAlignment(.center)
                          }
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("PastelPink"))
                            Text("Find what keeps you motivated")
                                .multilineTextAlignment(.center)
                        }
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("PastelPink"))
                            Text("Never undervalue your emotions")
                                .multilineTextAlignment(.center)
                        }
                        
                    }
                    
                }
                Divider()
                
                HStack {
                    NavigationLink(destination: LoggingView()) {
                        Text("Create Log +")
                            .foregroundColor(Color.blue)
                        Spacer()
                        NavigationLink(destination: AboutView() ) {
                            Text("About MoodLens")
                            .foregroundColor(Color.blue)
                            }
                        }
                        
                    }
               
                Spacer()
            }
            Spacer()
            
        }
        .padding()
        .ignoresSafeArea(edges: .all)    }
}

#Preview {
    ContentView()
}
