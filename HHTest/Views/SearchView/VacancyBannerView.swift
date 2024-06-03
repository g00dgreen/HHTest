//
//  VacancyBannerView.swift
//  HHTest
//
//  Created by Артем Макар on 2.06.24.
//

import SwiftUI

struct VacancyBannerView: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let lookingNumber = vacancy.lookingNumber, lookingNumber > 0 {
                Text("Сейчас просматривает \(lookingNumber) человек")
                    .font(.appFont(.text1))
                    .foregroundStyle(.appGreen)
            }
            
            Text(vacancy.title)
                .font(.appFont(.title3))
                .foregroundStyle(.white)
            
            if let salary = vacancy.salary.short {
                Text(salary)
                    .font(.appFont(.title2))
                    .foregroundStyle(.white)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(vacancy.address.town)
                    .font(.appFont(.text1))
                    .foregroundStyle(.white)
                HStack(alignment: .center, spacing: 8) {
                    Text(vacancy.company)
                        .font(.appFont(.text1))
                        .foregroundStyle(.white)
                    Image("check")
                        .frame(width: 16, height: 16)
                }
            }
                .foregroundStyle(.white)
            
            HStack(alignment: .center, spacing: 8) {
                Image("bag")
                    .frame(width: 16, height: 16)
                Text(vacancy.experience.previewText)
                    .font(.appFont(.text1))
                    .foregroundStyle(.white)
            }
                .foregroundStyle(.white)
            
            Text(convertedDate)
                .font(.appFont(.text1))
                .foregroundStyle(.appGrey3)
            
            MainButton(
                text: "Откликнуться",
                font: .buttonText2,
                isCircleButton: true,
                action: {coordinator.push(.vacancy(vacancyData: vacancy))}
            )
        }
            .overlay(alignment: .topTrailing) {
                Button {
                    viewModel.chengeVacancyStatus(vacancy: vacancy)
                } label: {
                    Image(vacancy.isFavorite ? "favoritesFill" : "favorites")
                        .resizable()
                        .foregroundColor(.white)
                        .frame( width: 24, height: 24 )
                }
            }
    }
    
    let vacancy: Vacancy
    @EnvironmentObject private var viewModel: ViewModel
    @EnvironmentObject private var coordinator: Coordinator
    
    private var convertedDate: String {
        let text = vacancy.publishedDate.components(separatedBy: "-")
        let day = String(Int(text[2]) ?? -1)
        let month = Months.getMonth(Int(text[1]) ?? 0)
        return  "Опубликовано \(day) \(month)"
    }
}

#Preview {
    VacancyBannerView(
        vacancy:
                .init(id: "1",
                      lookingNumber: 2,
                      title: "#45",
                      address: Address.init(town: "1", street: "2", house: "3"),
                      company: "4",
                      experience: Experience(previewText: "5", text: "6"),
                      publishedDate: "7",
                      isFavorite: true,
                      salary: Salary(full: "8", short: "9"),
                      schedules: ["10", "11"],
                      appliedNumber: 12,
                      description: "13",
                      responsibilities: "14",
                      questions: ["15","16"]
                     )
    )
}
