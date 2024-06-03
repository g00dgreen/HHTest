//
//  CustomTextField.swift
//  HHTest
//
//  Created by Артем Макар on 30.05.24.
//

import SwiftUI

struct CustomTextField: View {
    
    init(text: Binding<String>, isValid: Binding<Bool>, prompt: String, imageName: String) {
        self._text = text
        self._isValid = isValid
        self.prompt = prompt
        self.imageName = imageName
    }
    
    var body: some View {

        HStack(alignment: .center) {
            if isEmpty() {
                Image(imageName)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.white)
            }
            TextField(
                "",
                text: $text,
                prompt: Text(prompt)
                            .foregroundColor(.appGrey4)
            )
                .frame(height: 40)
                .font(.appFont(.text1))
                .foregroundStyle(.white)
                .animation(.easeOut, value: isEmpty())
            if !isEmpty(){
                Button(action: {
                    withAnimation {
                        $text.wrappedValue = ""
                    }
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.gray)
                        .padding(.trailing, 8)
                }
                    .padding(.trailing, 5)
                    .opacity($text.wrappedValue.isEmpty ? 0 : 1)
            }
        }
        .padding(.horizontal, 4)
        .overlay(isValid ? .clear : .appRed, in: .rect(cornerRadius: 8).stroke(lineWidth: 1))
        .background(Color(.appGrey2).clipShape(RoundedRectangle(cornerRadius:8)))
        if !isValid {
            Text("Вы ввели неверный e-mail")
                .foregroundStyle(.appRed)
        }
    }
    
    @Binding private var text: String
    @Binding private var isValid: Bool
    private var prompt: String
    private var imageName: String
    
    private func isEmpty() -> Bool {
        return text == ""
    }
}
