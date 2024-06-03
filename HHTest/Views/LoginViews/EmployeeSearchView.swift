//
//  EmployeeSearchView.swift
//  HHTest
//
//  Created by Артем Макар on 30.05.24.
//

import SwiftUI

struct EmployeeSearchView: View {

    var body: some View {
        VStack(alignment: .leading) {
            Text("Поиск работы")
                .font(.appFont(.title3))
                .foregroundStyle(.white)
            CustomTextField(text: $text, isValid: $isValidEmail, prompt: "Электронная почта", imageName: "letter")
            HStack(spacing: 16) {
                MainButton(
                    text: "Продолжить",
                    font: .buttonText1,
                    backgroundColor: .appBlue,
                    backgroundDisabledColor: .appDarkBlue,
                    isCircleButton: false,
                    frameHeight: 40,
                    action: {
                        if isValidEmailAddress(emailAddressString: text) {
                            coordinator.changeTab(to: .codeLogin(email: text))
                        } else {
                            withAnimation {
                                isValidEmail = false
                            }
                        }
                    }
                )
                .disabled(isEmpty())
                Button {
                    
                } label: {
                    Text("Войти с паролем")
                }
                .foregroundStyle(.appBlue)
            }
        }
        .onChange(of: text) { _ in
            withAnimation {
                isValidEmail = true
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 24)
        .background(.appGrey1)
        .cornerRadius(8)
    }
    
    @EnvironmentObject private var coordinator: Coordinator
    @State private var text = ""
    @State private var isValidEmail = true
    
    private func isEmpty() -> Bool {
        return text == ""
    }
    
    private func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            returnValue = false
        }
        
        return  returnValue
    }
}

#Preview {
    EmployeeSearchView()
}
