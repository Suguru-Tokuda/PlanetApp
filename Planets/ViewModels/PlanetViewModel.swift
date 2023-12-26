//
//  PlanetViewModel.swift
//  Planets
//
//  Created by Suguru Tokuda on 11/20/23.
//

import Foundation
import Combine

class PlanetViewModel: ObservableObject {
    var planets: [Planet] = []
    @Published var filteredList: [Planet] = []
    @Published var isErrorOccured: Bool = false
    @Published var searchText: String = ""
    @Published var isLoading: Bool = false
    var nextUrl: String?
    var apiCancellables = Set<AnyCancellable>()
    var customError: NetworkError?
    var manager: Networking
    var apiTask: AnyCancellable?

    init(manager: Networking = NetworkManager()) {
        self.manager = manager
    }

    deinit {
        self.apiCancellables.removeAll()
    }

    func loadPlanets(urlString: String) {
        self.apiTask?.cancel()
        guard !isLoading else { return }
        guard !(!planets.isEmpty && nextUrl == nil) else { return }
        
        let urlStr = nextUrl ?? urlString
        
        guard let url = URL(string: urlStr) else {
            customError = NetworkError.badUrl
            return
        }
        
        DispatchQueue.main.async {
            self.isLoading = true
        }

        apiTask = manager.getDataFromNetworkLayer(url: url, type: PlanetResponse.self)
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    switch error {
                    case NetworkError.badUrl:
                        self.customError = NetworkError.badUrl
                    case NetworkError.parsing:
                        self.customError = NetworkError.parsing
                    case NetworkError.dataNotFound:
                        self.customError = NetworkError.dataNotFound
                    case NetworkError.serverNotFound:
                        self.customError = NetworkError.serverNotFound
                    default:
                        self.customError = NetworkError.dataNotFound
                    }
                    self.isErrorOccured = true
                    self.isLoading = false
                }
            } receiveValue: { val in
                self.planets += val.results
                self.filterResultsFromUserList(searchText: self.searchText)
                self.isLoading = false
                self.nextUrl = val.next
            }
//            .store(in: &apiCancellables)
    }
    
    func refreshData() {
        DispatchQueue.main.async {
            self.planets = []
            self.isLoading = false
            self.nextUrl = nil
            self.loadPlanets(urlString: APIEndpoint.apiEndPoint)
        }
    }

    func cancellOnGoingTask() {
        apiCancellables.removeAll()
        self.isLoading = false
    }

    func filterResultsFromUserList(searchText: String) {
        if searchText.isEmpty {
            self.filteredList = planets
        } else {
            self.filteredList = planets.filter({ $0.name.localizedCaseInsensitiveContains(searchText.lowercased() )})
        }
    }

    func setErrorOccuredToFalse() {
        DispatchQueue.main.async {
            self.isErrorOccured = false
            self.customError = nil
        }
    }
}
