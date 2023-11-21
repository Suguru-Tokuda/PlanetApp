//
//  PlanetDetailView.swift
//  Planets
//
//  Created by Suguru Tokuda on 11/20/23.
//

import SwiftUI

struct PlanetDetailView: View {
    var planet: Planet
    
    var body: some View {
        ZStack {
            Color
                .darkGray
                .ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading) {
                    getTitle()
                    PlanetClimatesView(climates: planet.climates)
                    LabelValueView(systemImageName: "circle.dashed", label: "Rotation Period", value: String(planet.rotationPeriod))
                    LabelValueView(systemImageName: "circle", label: "Orbital period", value: String(planet.orbitalPeriod))
                    LabelValueView(systemImageName: "circle.slash", label: "Diameter", value: Double(planet.diameter).formatted())
                    LabelValueView(systemImageName: "scalemass.fill", label: "Gravity", value: planet.gravity)
                    LabelValueView(systemImageName: "drop.fill", label: "Surface Water", value: String(planet.surfaceWater))
                    LabelValueView(systemImageName: "person.3.fill", label: "Population", value: planet.population.formatted())
                    Spacer()
                }
                .padding(.horizontal, 10)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

extension PlanetDetailView {
    @ViewBuilder
    func getTitle() -> some View {
        Text(planet.name)
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundStyle(.white)
    }
}


#Preview {
    
    PlanetDetailView(planet: PreviewData.planets[0])
}
