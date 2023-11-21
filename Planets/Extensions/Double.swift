//
//  Double.swift
//  Planets
//
//  Created by Suguru Tokuda on 11/20/23.
//

import Foundation

extension Double {
    func commaFormatted() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: self)) ?? "0"
    }
}
