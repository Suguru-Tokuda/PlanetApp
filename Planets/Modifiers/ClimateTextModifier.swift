//
//  ClimateTextModifier.swift
//  Planets
//
//  Created by Suguru Tokuda on 11/20/23.
//

import SwiftUI


struct ClimateTextModiifer: ViewModifier {
    var backgroundColor: Color
    func body(content: Content) -> some View {
        ZStack {
            content
                .padding(.horizontal, 10)
                .padding(.vertical, 2)
                .foregroundStyle(.white)
        }
        .font(.caption)
        .fontWeight(.bold)
        .background(backgroundColor)
        .clipShape(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
        )
    }
}
