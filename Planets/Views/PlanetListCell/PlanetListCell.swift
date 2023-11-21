//
//  PeopleCell.swift
//  PeoplesManagement
//
//  Created by Suguru Tokuda on 11/8/23.
//

import SwiftUI

struct PlanetListCell: View {
    var planet: Planet
    var body: some View {
        ZStack {
            Color.darkGray
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 1) {
                        Text(planet.name)
                            .font(.title3)
                            .fontWeight(.heavy)
                            .foregroundStyle(.white)
                        
                        PlanetClimatesView(climates: planet.climates)
                    }
                    Spacer()
                    PopulationLabel(population: planet.population)
                }
                HStack {
                    PlanetParameterListView(planet: planet)
                    Spacer()
                }
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
        }
        .frame(minHeight: 150)
        .frame(maxHeight: 200)
    }
}

#Preview {
    PlanetListCell(planet: PreviewData.planets[0])
}
