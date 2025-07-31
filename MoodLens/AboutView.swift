//
//  AboutView.swift
//  MoodLens
//
//  Created by Maggie Le on 7/30/25.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack (spacing: 20) {
            Text("About MoodLens")
                .foregroundColor(Color("BlueColorText"))
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
               
                
        }
        Spacer()
        .padding()
    }
}

#Preview {
    AboutView()
}
