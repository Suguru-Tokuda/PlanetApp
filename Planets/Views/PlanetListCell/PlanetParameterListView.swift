//
//  PlanetParameterListView.swift
//  Planets
//
//  Created by Suguru Tokuda on 11/20/23.
//

import SwiftUI


struct PlanetParameterListView: View {
    var planet: Planet
    var iconTextModels: [IconTextModel]
    
    init(planet: Planet) {
        self.planet = planet
        self.iconTextModels = [
            IconTextModel(systemImageName: "drop.fill", value: String(planet.surfaceWater)),
            IconTextModel(systemImageName: "circle.slash", value: Double(planet.diameter).commaFormatted()),
            IconTextModel(systemImageName: "arrow.circlepath", value: String(planet.rotationPeriod))
        ]
    }
    
    var body: some View {
        HStack {
            ForEach(iconTextModels.indices, id: \.self) { i in
                IconTextView(systemImageName: iconTextModels[i].systemImageName, value: iconTextModels[i].value)
                
                if i < iconTextModels.count - 1 {
                    Image(systemName: "circle.fill")
                        .resizable()
                        .frame(width: 5, height: 5)

                }
            }
        }
        .foregroundColor(.lightGray)
    }
}

#Preview {
    PlanetParameterListView(planet: PreviewData.planets[0])
}
