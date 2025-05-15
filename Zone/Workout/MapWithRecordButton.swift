//
//  DetailView.swift
//  Zone
//
//  Created by Alexis Ponce on 5/15/25.
//
import SwiftUI
import MapKit

struct MapWithRecordButton: View {
    
    var item: HomeRowItem
    @State var hasCentered = false
    @State private var trackingMode: MapUserTrackingMode = .none
    @StateObject var locationManager = LocationManager()
    // Default location - Apple HQ
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.334_900, longitude: -122.009_020),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )

    var body: some View {
        ZStack(alignment: .bottom) {
            // your “map” view clipped to a rounded rect
            Map(coordinateRegion: $region, userTrackingMode: $trackingMode)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .shadow(radius: 4)
                .padding()
                .onAppear {
                    locationManager.requestPermission()
                }
                .onReceive(locationManager.$location) { loc in
                       guard let loc = loc, !hasCentered else { return }
                       // Zoom in a bit tighter once we have a fix
                       region = MKCoordinateRegion(
                           center: loc.coordinate,
                           span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                       )
                    hasCentered = true
                   }

            // record button
            Button(action: {
                trackingMode = .follow
            }) {
                Circle()
                    .fill(Color.red)
                    .frame(width: 56, height: 56)
                    .shadow(radius: 4)
            }
            .padding(.bottom, 24)
        }
        .navigationTitle(item.title)
    }
}

struct MapWithRecordButton_Previews: PreviewProvider {
    static var previews: some View {
        MapWithRecordButton(item: .init(icon: "", title: "Outdoor Workout"))
    }
}
