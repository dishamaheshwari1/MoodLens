//
//  MoodGrid.swift
//  MoodLens
//
//  Created by Angelia on 7/29/25.
//

import SwiftUI

struct MoodGrid: View {
    
    let adaptive: [GridItem] = Array(repeating: .init(.adaptive(minimum: 50, maximum: 65)), count: 7)
    
    var body: some View {
        
        VStack {
            Text("Mood Graph for this month")
                .font(.title)
                .fontWeight(.semibold)
            Divider()
                .padding(.horizontal, 30.0)
            
            HStack {
                Text ("Sun")
                Spacer()
                    .frame(width: 18)
                Text ("Mon")
                Spacer()
                    .frame(width: 16.0)
                Text ("Tue")
                Spacer()
                    .frame(width: 17.0)
                Text ("Wed")
                Spacer()
                    .frame(width: 17)
                Text ("Thu")
                Spacer()
                    .frame(width: 27)
                Text ("Fri")
                Spacer()
                    .frame(width: 30.0)
                Text ("Sat")
            }
            .padding(.horizontal, 23)
            .font(.title3)
            
            ZStack {
                LazyVGrid (columns:adaptive, spacing: 5, pinnedViews: [.sectionHeaders]) {
                    Section {
                        ForEach(0..<31) {_ in
                            Color (.gray)
                                .cornerRadius(10)
                                .frame(height: 50)
                        }
                    }
                }
                .padding([.leading, .bottom, .trailing])
            }
            ColorPaletteView()
                .padding(.trailing)
        }
        }
    }
#Preview {
    MoodGrid()
}
