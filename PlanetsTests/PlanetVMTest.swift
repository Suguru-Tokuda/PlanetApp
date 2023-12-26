//
//  PlanetVMTest.swift
//  PlanetsTests
//
//  Created by Suguru Tokuda on 11/20/23.
//

import XCTest
@testable import Planets

final class PlanetVMTest: XCTestCase {
    private var vm: PlanetViewModel!
    
    override func setUpWithError() throws {
        vm = PlanetViewModel(manager: FakeNetworkManager())
    }

    override func tearDownWithError() throws {
        vm = nil
    }
    
    func testGetDataFromViewModel_whenWeAreExpecting_GoodResults() {
        vm.loadPlanets(urlString: "PlanetResponse")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            XCTAssertEqual(self.vm.filteredList.count, 10)
            
            let planet: Planet? = self.vm.filteredList.first
            
            XCTAssertEqual(planet?.name, "Tatooine")
            XCTAssertNil(self.vm.customError)
        }
    }

    func testFilterPlanets_whenWeAreExpecting_GoodResults() {
        vm.loadPlanets(urlString: "PlanetResponse")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.vm.filterResultsFromUserList(searchText: "alderaan")
            XCTAssertEqual(self.vm.filteredList.count, 1)
            
            let planet: Planet? = self.vm.filteredList.first
            
            XCTAssertEqual(planet?.name, "Alderaan")
            XCTAssertNil(self.vm.customError)
        }

    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
