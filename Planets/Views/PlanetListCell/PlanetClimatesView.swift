//
//  PlanetClimatesView.swift
//  Planets
//
//  Created by Suguru Tokuda on 11/20/23.
//

import SwiftUI

struct PlanetClimatesView: View {
    var climates: [String]
    var body: some View {
        HStack {
            ForEach(climates, id: \.self) { climate in
                Text(climate.capitalizedSentence)
                    .modifier(ClimateTextModiifer(backgroundColor: .green))
            }
        }
    }
}

#Preview {
    PlanetClimatesView(climates: ["Forests", "Mountains", "Lakes"])
}
