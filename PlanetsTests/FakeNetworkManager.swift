//
//  FakeNetworkManager.swift
//  PeoplesManagementTests
//
//  Created by Suguru Tokuda on 11/10/23.
//

import Foundation
import Combine
@testable import Planets

class FakeNetworkManager: Networking {
    func getDataFromNetworkLayer<T>(url: URL, type: T.Type) -> AnyPublisher<T, Error> where T : Decodable {
        let bundle = Bundle(for: FakeNetworkManager.self)
        let url = bundle.url(forResource: url.absoluteString, withExtension: "json")
        
        guard let url = url else {
            return Fail(error: NetworkError.badUrl).eraseToAnyPublisher()
        }
        
        do {
            let rawData = try Data(contentsOf: url)
            let result = try JSONDecoder().decode(type.self, from: rawData)
            return Just(result)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        } catch {
            return Fail(error: error).eraseToAnyPublisher()
        }
    }
}
