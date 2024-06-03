//
//  BannerView.swift
//  HHTest
//
//  Created by Артем Макар on 2.06.24.
//

import SwiftUI

import SwiftUI



struct BannerView: View {
    
    init(
        bannerId: String,
        text: String,
        buttonTitle: String? = nil
    ) {
        self.text = text
        self.buttonTitle = buttonTitle
        self.bannerId = bannerId
        
        switch bannerId {
        case "near_vacancies":
            (self.imageName, self.imageBackground) = ("place", .appDarkBlue)
        case "level_up_resume":
            (self.imageName, self.imageBackground) = ("star", .appDarkGreen)
        case "temporary_job":
            (self.imageName, self.imageBackground) = ("note", .appDarkGreen)
        default:
            (self.imageName, self.imageBackground) = ("search", .appGrey3)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack {
                Image(imageName)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .background(imageBackground, in: .circle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(4)
            }
            .padding(.bottom, 8)
            Text(text)
                .font(.appFont(.title4))
                .foregroundStyle(.white)
            if let button = buttonTitle {
                Text(button)
                    .font(.appFont(.title4))
                    .foregroundStyle(.appGreen)
            }
            Spacer(minLength: 8)
        }
        .padding( 8)
        .frame(maxWidth: .infinity)
        .frame(width: 120, height: 132)
        .background(.appGrey2, in: RoundedRectangle(cornerRadius: 8))
    }
    
    private let text: String
    private let buttonTitle: String?
    private let bannerId: String
    private let imageName: String
    private let imageBackground: Color
    
    private func currentImageName(id: String) -> String {
        switch bannerId {
        case "near_vacancies":
            return "place"
        case "level_up_resume":
            return "star"
        case "temporary_job":
            return "note"
        default:
            return "note"
        }
    }
    
    private func currentImageBackground(id: String) -> Color {
        switch bannerId {
        case "near_vacancies":
            return .appBlue
        default:
            return .appGreen
        }
    }
}

#Preview {
    BannerView(
        bannerId: "temporary_job",
        text: "Временная работа и подработка",
        buttonTitle: "Поднять"
    )
}
