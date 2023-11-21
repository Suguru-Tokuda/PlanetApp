//
//  PeopleListView.swift
//  PeoplesManagement
//
//  Created by Suguru Tokuda on 11/8/23.
//

import SwiftUI

struct PlanetListView: View {
    @StateObject var vm = PlanetViewModel()
    
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            NavigationView {
                ZStack {
                    if vm.filteredList.isEmpty && vm.isLoading {
                        Button(action: {
                            vm.cancellOnGoingTask()
                        }, label: {
                            Text("Cancel")
                        })
                        .zIndex(1001)
                    }
                    getPlanetList()
                        .zIndex(1000)
                        .onAppear {
                            vm.loadPlanets(urlString: APIEndpoint.apiEndPoint)
                        }
                        .alert("Error", isPresented: $vm.isErrorOccured, actions: {
                            Button(role: .cancel) {
                                vm.setErrorOccuredToFalse()
                            } label: {
                                Text("OK")
                            }
                        }, message: {
                            Text(vm.customError?.localizedDescription ?? "")
                        })
                }
            }
            .searchable(
                text: $vm.searchText,
                placement: .automatic,
                prompt: "Search Planets"
            )
            .onChange(of: vm.searchText) { _, newValue in
                vm.filterResultsFromUserLIst(searchText: newValue)
            }
        }
    }
}

extension PlanetListView {
    @ViewBuilder
    func getPlanetList() -> some View {
        List {
            ForEach(vm.filteredList.indices, id: \.self) { i in
                PlanetListCell(planet: vm.filteredList[i])
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 1, trailing: 0))
                    .onAppear {
                        if i == vm.filteredList.count - 1 {
                            vm.loadPlanets(urlString: APIEndpoint.apiEndPoint)
                        }
                    }
            }
            if vm.isLoading {
                HStack(alignment: .center) {
                    ProgressView("Loading")
                }
                .frame(minHeight: 100)
                .frame(maxHeight: 100)
                .frame(maxWidth: .infinity)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 1, trailing: 0))
            }
        }
        .refreshable {
            vm.refreshData()
        }
    }
}

#Preview {
    PlanetListView()
}
