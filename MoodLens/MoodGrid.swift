//
//  MoodGrid.swift
//  MoodLens
//
//  Created by Angelia on 7/29/25.
//

import SwiftUI


struct MoodGrid: View {
    
    let adaptive: [GridItem] = Array(repeating: .init(.adaptive(minimum: 50, maximum: 100)), count: 1)
    
    var body: some View {
                
        VStack {
            Text("Mood Graph for this month")
                .font(.title)
                .fontWeight(.semibold)
            Divider()
                .padding(.horizontal, 30.0)
            
            LazyVGrid (columns:adaptive, spacing: 10, pinnedViews: [.sectionHeaders]) {
                Section {
                    ForEach(0..<31) {_ in
                        Color (red: .random(in: 0...1), green: .random(in:0...1), blue: .random(in: 0...1))
                            .cornerRadius(20)
                            .frame(height: 50)
                    }
                }
            }
            .padding(.horizontal)
        }
        
        
        
        
    }
}

#Preview {
    MoodGrid()
}
