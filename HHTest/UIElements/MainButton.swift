//
//  DefaultButton.swift
//  HHTest
//
//  Created by Артем Макар on 30.05.24.
//

import SwiftUI

struct MainButton: View {
    
    init(
        text: String,
        font: FontConstant,
        backgroundColor: Color = .appGreen,
        backgroundDisabledColor: Color = .appDarkGreen,
        isCircleButton: Bool,
        frameHeight: CGFloat = 32,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.backgroundColor = backgroundColor
        self.backgroundDisabledColor = backgroundDisabledColor
        self.font = font
        self.isCircleButton = isCircleButton
        self.frameHeight = frameHeight
        self.action = action
    }
    
    private let text: String
    private let font: FontConstant
    private let backgroundColor: Color
    private let backgroundDisabledColor: Color
    private let isCircleButton: Bool
    private let frameHeight: CGFloat
    private let action: () -> Void
    @Environment(\.isEnabled) private var isEnabled
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Spacer()
                Text(text)
                    .font(.appFont(font))
                Spacer()
            }
        }
        .foregroundStyle(.white)
        .frame(height: frameHeight)
        .background(isEnabled ? backgroundColor : backgroundDisabledColor)
        .cornerRadius(isCircleButton ? 50 : 8)
    }
}

#Preview {
    MainButton(text: "Some Text", font: .buttonText2, isCircleButton: true, action: {})
}
