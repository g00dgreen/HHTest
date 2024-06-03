//
//  VerificationCodeStackView.swift
//  HHTest
//
//  Created by Артем Макар on 31.05.24.
//

import SwiftUI
import Combine

struct VerificationCodeStackView: View {
    
    enum CodeFocusState: Hashable {
        case first
        case second
        case third
        case fourth
    }
    
    init(codeArray: Binding<[String]>) {
        self._codeArray = codeArray
    }
    
    
    var body: some View {
        HStack(alignment: .center) {
            ForEach(0..<codeArray.count) { value in
                TextField(
                    "",
                    text: $codeArray[value],
                    prompt: Text("*")
                        .foregroundColor(.appGrey3)
                )
                .foregroundColor(.white)
                .focused($codeFocusState, equals: getFocusState(value))
                .onChange(of: codeArray[value]) { _ in
                    changeCodePosition(position: value, count: codeArray[value].count)
                }
                .keyboardType(.numberPad)
                .onReceive(Just(codeArray[value])) { newValue in
                    let filtered = newValue.filter { $0.isNumber }
                    if filtered != newValue {
                        codeArray[value] = filtered
                    }
                }
                .multilineTextAlignment(.center)
                .frame(width: 48, height: 48)
                .background(Color(.appGrey2).clipShape(RoundedRectangle(cornerRadius:8)))
            }
        }
        .onAppear {
            codeFocusState = .first
        }
    }
    
    @FocusState private var codeFocusState: CodeFocusState?
    @Binding private var codeArray: [String]
    
    private func getFocusState(_ value: Int) -> CodeFocusState? {
        switch value {
        case 0:
            return .first
        case 1:
            return .second
        case 2:
            return .third
        case 3:
            return .fourth
        default:
            return nil
        }
    }
    
    private func changeCodePosition(position: Int, count: Int) {
            switch count {
            case 0:
                if position > 0 {
                    codeFocusState = getFocusState(position-1)
                }
            case 1:
                if position < codeArray.count-1 {
                    codeFocusState = getFocusState(position+1)
                }
            default:
                codeArray[position] = String(codeArray[position].last!)
                if position < codeArray.count-1 {
                    codeFocusState = getFocusState(position+1)
                }
            }
    }
}
