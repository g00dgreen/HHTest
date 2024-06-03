//
//  Constants.swift
//  HHTest
//
//  Created by Артем Макар on 1.06.24.
//

import Foundation

enum Constants {
    static let baseURL = "https://run.mocky.io/v3/d67a278f-ddcb-438c-bf56-3194c529b12b"
}

struct Months {
    static func getMonth(_ number: Int) -> String {
        switch number {
        case 1:
            return "января"
        case 2:
            return "февраля"
        case 3:
            return "марта"
        case 4:
            return "апреля"
        case 5:
            return "мая"
        case 6:
            return "июня"
        case 7:
            return "июля"
        case 8:
            return "августа"
        case 9:
            return "сентября"
        case 10:
            return "октября"
        case 11:
            return "ноября"
        case 12:
            return "декабря"
        default:
            return ""
        }
    }
}
