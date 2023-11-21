//
//  PreviewData\.swift
//  Planets
//
//  Created by Suguru Tokuda on 11/20/23.
//

import Foundation

struct PreviewData {
    static let planets: [Planet] = [
        Planet(name: "Tatooine", rotationPeriod: 23, orbitalPeriod: 304, diameter: 10465, gravity: "1 standard", terrain: "dessert", surfaceWater: 1, climates: ["arid"], population: 200000, residents: [
            "https://swapi.dev/api/people/1/",
            "https://swapi.dev/api/people/2/",
            "https://swapi.dev/api/people/4/",
            "https://swapi.dev/api/people/6/",
            "https://swapi.dev/api/people/7/",
            "https://swapi.dev/api/people/8/",
            "https://swapi.dev/api/people/9/",
            "https://swapi.dev/api/people/11/",
            "https://swapi.dev/api/people/43/",
            "https://swapi.dev/api/people/62/"
        ], films: [
            "https://swapi.dev/api/films/1/",
            "https://swapi.dev/api/films/3/",
            "https://swapi.dev/api/films/4/",
            "https://swapi.dev/api/films/5/",
            "https://swapi.dev/api/films/6/"
        ], created: "2014-12-09T13:50:49.641000Z", edited: "2014-12-20T20:58:18.411000Z", url: "https://swapi.dev/api/planets/1/")

    ]
}
