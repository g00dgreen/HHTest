//
//  CodeLoginView.swift
//  HHTest
//
//  Created by Артем Макар on 31.05.24.
//

import SwiftUI

struct CodeLoginView: View {
    
    init(email: String) {
        self.email = email
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Отправили код на \(email)")
                .font(.appFont(.title2))
                .foregroundStyle(.white)
            Text("Напишите его, чтобы подтвердить, что это вы, а не кто-то другой входит в личный кабинет")
                .font(.appFont(.title3))
                .foregroundStyle(.white)
            VerificationCodeStackView(codeArray: $codeArray)
            MainButton(
                text: "Подтвердить",
                font: .buttonText1,
                backgroundColor: .appBlue,
                backgroundDisabledColor: .appDarkBlue,
                isCircleButton: false,
                frameHeight: 48) {
                    viewModel.endUserAuthentication(with: "")
                    coordinator.changeTab(to: .search)
                }
                .disabled(isValid())
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    @EnvironmentObject private var viewModel: ViewModel
    @EnvironmentObject private var coordinator: Coordinator
    private let email: String
    @State private var codeArray = Array(repeating: "", count: 4)
    
    private func isValid() -> Bool {
        codeArray.filter { $0 != "" }.count != 4
    }
}

#Preview {
    CodeLoginView(email: "11234")
}
