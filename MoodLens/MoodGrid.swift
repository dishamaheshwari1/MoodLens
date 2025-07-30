//
//  MoodGrid.swift
//  MoodLens
//
//  Created by Scholar on 7/29/25.
//

import SwiftUI


struct MoodGrid: View {
    
    @State private var selectedColor: Color = .clear
    
    var body: some View {
                
        VStack {
            Text("Mood Graph for this month")
                .font(.title)
                .fontWeight(.semibold)
            
            Divider()
                .padding(.horizontal)
            Spacer()
        }
        
        VStack {
            ColorPicker(selection: $selectedColor, supportsOpacity: true, label: {
                Text("")
            })
            .frame(width: 11.0, height: 10.0)
            .padding()
            .background(RoundedRectangle(cornerRadius: 16).fill(selectedColor).stroke(.gray.opacity(0.4), style: .init(lineWidth: 2.0)))
        }
        .frame(width: 0.0, height: 0.0)
        .background(selectedColor)
        
        }
    }



#Preview {
    MoodGrid()
}
