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
                .frame(maxWidth: .infinity)
                .background(
                    Color.accentColor
                        .ignoresSafeArea(edges: [.top, .horizontal]))
                
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
                            Text("Mood Graph Summaries")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .padding(.bottom, -40.0)
                            Spacer()
                            NavigationLink(destination: MoodGrid()) {
                                Text(">")
                                    .font(.title2)
                                    .foregroundColor(Color.blue)
                                    .padding(.bottom, -40.0)

                                
                            }
                        }
                        
                    }
                    .padding(.horizontal, 7)
                    .padding(.vertical, 25)
                    
                    
                    HStack(spacing: 20) {
                        NavigationLink(destination: MoodGrid()) {
                            Text("Exercise")
                                .font(.title3)
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, minHeight: 50)
                                .background(Color("PastelGreen"))
                                .cornerRadius(10)
                        }
                        
                        NavigationLink(destination: Text("Destination")) {
                            Text("Me-Time")
                                .font(.title3)
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, minHeight: 50)
                                .background(Color("PastelGreen"))
                                .cornerRadius(10)
                        }
                        
                        NavigationLink(destination: Text("Destination")) {
                            Text("Sleep")
                                .font(.title3)
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, minHeight: 50)
                                .background(Color("PastelGreen"))
                                .cornerRadius(10)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 2)

                    
                    
                    //insights section
                    
                    VStack(spacing: 8) {
                        Text("Emotional Insights")
                            .font(.title3)
                            .padding(.top, 70.0)
                            .frame(height: 5.0)
                            .fontWeight(.semibold)

                        
                        
                        HStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color("PastelPink"))
                                Text("Recognize your own emotional state to see how it affects your daily life")
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
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
                        .padding(.top, 60)
                        
                        
                    }
                    Divider()
                    
                    HStack {
                        NavigationLink(destination: LoggingView()) {
                            Text("Create Log +")
                                .foregroundColor(Color.blue)
                                .frame(maxWidth: .infinity, alignment: .center) // Center horizontally
                            
                        }
                        
                    }
                    
                    Spacer()
                }
                Spacer()
                
            }
            .padding()
            .ignoresSafeArea(edges: .all)
        }
    }
}

#Preview {
    ContentView()
}
