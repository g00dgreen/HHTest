//
//  OverlayCounter.swift
//  HHTest
//
//  Created by Артем Макар on 3.06.24.
//

import SwiftUI

struct OverlayCounter: ViewModifier {
    let number: Int
    
    func body(content: Content) -> some View {
        if number > 0 {
            content.overlay(alignment: .topTrailing) {
                Text(
                    number < 99 ?
                    number.formatted() :
                        "99+"
                )
                .lineLimit(1)
                .font(.appFont(.number))
                .foregroundStyle(.white)
                .padding(.horizontal, 4)
                .frame(minWidth: 13, minHeight: 13)
                .background(.red, in: Capsule())
                .offset( x: 4, y: -4)
            }
        } else {
            content
        }
    }
}
