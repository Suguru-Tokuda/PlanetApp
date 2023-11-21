//
//  DiameterView.swift
//  Planets
//
//  Created by Suguru Tokuda on 11/20/23.
//

import SwiftUI

struct IconTextModel: Identifiable {
    var id = UUID()
    var systemImageName: String
    var value: String
}

struct IconTextView: View {
    var systemImageName: String
    var value: String
    
    var body: some View {
        HStack(spacing: 1) {
            Image(systemName: systemImageName)
            Text(value)
        }
        .fontWeight(.semibold)
        .font(.caption)
    }
}

#Preview {
    IconTextView(systemImageName: "circle.slash", value: Double(12500).commaFormatted())
}
