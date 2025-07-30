//
//  colorPickerView.swift
//  MoodLens
//
//  Created by Scholar on 7/30/25.
//

import SwiftUI

struct ColorPickerView: View {
    private let colors: [Color] = [.red, .green, .blue, .yellow, .purple, .orange]
    private let colorNames: [String] = ["Frustrated", "Calm", "Sad", "Happy", "Exhausted", "Anxious"]
    
    @State private var selectedColorIndex = 0

    var body: some View {
        VStack {
            Text("Select a color:")
                .font(.title3)
                .fontWeight(.semibold)
                .padding()
                .frame(height: -8.0)

            Picker("Colors", selection: $selectedColorIndex) {
                ForEach(colors.indices, id: \.self) { index in
                    HStack {
                        Text(colorNames[index])
                            .foregroundColor(colors[index])
                    }
                    .tag(index)
                }
            }
            .pickerStyle(.wheel)

            Text("You selected: \(colorNames[selectedColorIndex])")
                .font(.title2)
                .foregroundColor(colors[selectedColorIndex])
                .fontWeight(.medium)
                .padding()
                .frame(height: -8.0)
        }
        .padding()
    }
}


#Preview {
    ColorPickerView()
}
