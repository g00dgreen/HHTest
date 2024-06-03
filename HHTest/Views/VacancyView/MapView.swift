//
//  MapView.swift
//  HHTest
//
//  Created by Артем Макар on 2.06.24.

import SwiftUI
import MapKit

struct MapView: View {
    
    init(title: String, addres: String) {
        self.title = title
        self.addres = addres
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 8) {
                Text(title)
                    .font(.appFont(.title3))
                    .foregroundStyle(.white)
                Image("check")
                    .resizable()
                    .frame(width: 16, height: 16)
                    .foregroundStyle(.white)
                Spacer()
            }
            map
                .cornerRadius(8)
                .frame(height: 134)
            Text(addres)
                .font(.appFont(.title4))
                .foregroundStyle(.white)
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
        .background(.appGrey1, in: RoundedRectangle(cornerRadius: 8))
    }
    
    private let title: String
    private let addres: String
    
    private let locations: [MapLocation] = [
        MapLocation.init(latitude:  55.792584, longitude: 49.124847)
    ]


    @ViewBuilder var map: some View {
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let center = CLLocationCoordinate2D(latitude:  55.792584, longitude: 49.124847)
        let region = MKCoordinateRegion(center: center, span: span)
        Map(coordinateRegion: .constant(region), annotationItems: locations, annotationContent: { item in
            MapMarker(coordinate: item.location)
        })
        .disabled(true)
    }

}

struct MapLocation: Codable, Identifiable {
    var id = UUID()
    var latitude, longitude: Double
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

#Preview {
    MapView(title: "Мобрикс", addres: "улица Пушкина, дом Колотушкина")
}
