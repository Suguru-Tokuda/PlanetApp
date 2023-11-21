import Foundation

struct PlanetResponse: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Planet]
}

struct Planet: Decodable, Identifiable {
    let id: UUID = UUID()
    let name: String
    let rotationPeriod, orbitalPeriod, diameter, surfaceWater: Int
    let gravity, terrain: String
    let climates: [String]
    let population: Double
    let residents, films: [String]
    let created, edited: String
    let url: String
            
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.rotationPeriod = Int(try container.decode(String.self, forKey: .rotationPeriod)) ?? 0
        self.orbitalPeriod = Int(try container.decode(String.self, forKey: .orbitalPeriod)) ?? 0
        self.diameter = Int(try container.decode(String.self, forKey: .diameter)) ?? 0
        self.gravity = try container.decode(String.self, forKey: .gravity)
        self.terrain = try container.decode(String.self, forKey: .terrain)
        self.surfaceWater = Int(try container.decode(String.self, forKey: .surfaceWater)) ?? 0
        let climateStr = try container.decode(String.self, forKey: .climate)
        self.climates = climateStr.components(separatedBy: ", ")
        self.population = Double(try container.decode(String.self, forKey: .population)) ?? 0
        self.residents = try container.decode([String].self, forKey: .residents)
        self.films = try container.decode([String].self, forKey: .films)
        self.created = try container.decode(String.self, forKey: .created)
        self.edited = try container.decode(String.self, forKey: .edited)
        self.url = try container.decode(String.self, forKey: .url)
    }
    
    init(name: String, rotationPeriod: Int, orbitalPeriod: Int, diameter: Int, gravity: String, terrain: String, surfaceWater: Int, climates: [String], population: Double, residents: [String], films: [String], created: String, edited: String, url: String) {
        self.name = name
        self.rotationPeriod = rotationPeriod
        self.orbitalPeriod = orbitalPeriod
        self.diameter = diameter
        self.gravity = gravity
        self.terrain = terrain
        self.surfaceWater = surfaceWater
        self.climates = climates
        self.population = population
        self.residents = residents
        self.films = films
        self.created = created
        self.edited = edited
        self.url = url        
    }


    enum CodingKeys: String, CodingKey {
        case name
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case diameter, climate, climates, gravity, terrain
        case surfaceWater = "surface_water"
        case population, residents, films, created, edited, url
    }
}
