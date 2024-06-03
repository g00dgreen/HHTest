//
//  ApplicantsBannerView.swift
//  HHTest
//
//  Created by Артем Макар on 2.06.24.
//

import SwiftUI

enum ApplicantsBannerType {
    case looking
    case applied
}

struct ApplicantsBannerView: View {
    
    init(image: Image, type: ApplicantsBannerType, count: Int?) {
        self.image = image
        self.type = type
        self.count = count
    }
    
    var body: some View {
        HStack(alignment: .top) {
                switch type {
                case .looking:
                    if let lookingNumber = count {
                        VStack(alignment: .leading) {
                            Text("\(lookingNumber) человек сейчас смотрят")
                                .font(.appFont(.text1))
                        }
                    }
                case .applied:
                    if let appliedNumber = count {
                        VStack(alignment: .leading) {
                            Text("\(appliedNumber) человек")
                                .font(.appFont(.text1).bold())
                            Text("уже откликнулись")
                                .font(.appFont(.text1))
                        }
                    } else {
                        VStack(alignment: .leading) {
                            Text("Будьте первым")
                                .font(.appFont(.text1).bold())
                            Text("откикнитесь сейчас")
                                .font(.appFont(.text1))
                        }
                    }
                }
                Spacer()
                image
                    .resizable()
                    .foregroundColor(.white)
                    .background(.appGreen, in: .circle)
                    .frame(width: 16, height: 16)
            }
            .padding(8)
            .background(.appDarkGreen, in: RoundedRectangle(cornerRadius: 8))
    }
    private let image: Image
    private let type: ApplicantsBannerType
    private let count: Int?
}

#Preview {
    ApplicantsBannerView(image: Image("eye"), type: .applied, count: 1)
}
