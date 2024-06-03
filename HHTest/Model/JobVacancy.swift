//
//  JobVacansy.swift
//  HHTest
//
//  Created by Артем Макар on 1.06.24.
//

import Foundation


struct JobVacancy: Codable {
    var offers: [Offer]
    var vacancies: [Vacancy]
}

// MARK: - Offer
struct Offer: Codable, Identifiable {
    let id: String?
    let title: String
    let link: String
    let button: ButtonText?
}

// MARK: - Button
struct ButtonText: Codable {
    let text: String
}

// MARK: - Vacancy
struct Vacancy: Codable, Identifiable {
    let id: String
    let lookingNumber: Int?
    let title: String
    let address: Address
    let company: String
    let experience: Experience
    let publishedDate: String
    var isFavorite: Bool
    let salary: Salary
    let schedules: [String]
    let appliedNumber: Int?
    let description: String?
    let responsibilities: String
    let questions: [String]
}

// MARK: - Address
struct Address: Codable {
    let town, street, house: String
}

// MARK: - Experience
struct Experience: Codable {
    let previewText, text: String
}

// MARK: - Salary
struct Salary: Codable {
    let full: String
    let short: String?
}
