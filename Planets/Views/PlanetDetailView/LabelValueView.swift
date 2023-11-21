//
//  LabelValueView.swift
//  Planets
//
//  Created by Suguru Tokuda on 11/20/23.
//

import SwiftUI

struct LabelValueView: View {
    var systemImageName: String
    var label: String
    var value: String
    
    var body: some View {
        HStack {
            Image(systemName: systemImageName)
                .resizable()
                .frame(width: 20, height: 20)
                .fontWeight(.bold)
                .foregroundStyle(.green)
            VStack(alignment: .leading) {
                Text(label)
                    .font(.callout)
                    .fontWeight(.semibold)
                Text(value)
            }
            .foregroundStyle(.white)
            Spacer()
        }
    }
}

#Preview {
    LabelValueView(systemImageName: "circle.dashed", label: "Rotation Period", value: "23")
}
