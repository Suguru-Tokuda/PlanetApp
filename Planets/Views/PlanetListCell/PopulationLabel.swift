//
//  PopulationLabel.swift
//  Planets
//
//  Created by Suguru Tokuda on 11/20/23.
//

import SwiftUI

struct PopulationLabel: View {
    var population: Double
    var body: some View {
        VStack(alignment: .trailing) {
            Text(population.commaFormatted())
                .fontWeight(.bold)
                .foregroundStyle(.green)
            Text("Population")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.lightGray)
        }
    }
}

#Preview {
    PopulationLabel(population: 20000000)
}
