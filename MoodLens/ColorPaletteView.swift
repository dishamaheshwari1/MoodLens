//
//  ColorPaletteView.swift
//  MoodLens
//
//  Created by Scholar on 7/30/25.
//

import SwiftUI

struct ColorPaletteView: View {
    
    enum ColorTag: String, CaseIterable, Identifiable {
        case red, green, blue, purple, orange, yellow
        
        var color: Color {
            switch self {
            case .red:
                return .red
            case .green:
                return .green
            case .blue:
                return .blue
            case .purple:
                return .purple
            case .orange:
                return .orange
            case .yellow:
                return .yellow
            }
        }
        
        var id: String { self.rawValue }
    }
    
    @State private var selectedColor: ColorTag = .red

    var body: some View {
        Menu {
            
            Picker("Select Color", selection: $selectedColor) {
                ForEach(ColorTag.allCases) { tag in
                    Image(systemName: "circle.fill")
                        .tint(tag.color)
                        .tag(tag)
                }
            }
            .pickerStyle(.palette)
            .paletteSelectionEffect(.custom)
            // Applying custom selection effect
        } label: {
            Label("What's your mood today?", systemImage: "paintpalette")
                .foregroundColor(selectedColor.color)
                .font(.title3)
            
        }
    }
}

#Preview {
    ColorPaletteView()
}
