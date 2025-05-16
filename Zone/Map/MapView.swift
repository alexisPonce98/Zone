//
//  MapView.swift
//  Zone
//
//  Created by Alexis Ponce on 5/16/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var cameraPositions: MapCameraPosition = .userLocation(followsHeading: true, fallback: .region( MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.334_900, longitude: -122.009_020),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )))
    // Default location - Apple HQ
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.334_900, longitude: -122.009_020),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    @State var hasCentered = false
    @ObservedObject var locationManager: LocationManager
    
    var body: some View {
        // your “map” view clipped to a rounded rect
        Map(position: $cameraPositions) {
            if !locationManager.path.isEmpty {
                MapPolyline(points: locationManager.path)
                    .stroke(.orange, lineWidth: 4.0)
            }
            UserAnnotation()
        }
        .mapControls {
               MapUserLocationButton()
               MapCompass()
               MapPitchToggle()
           }
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
    }
}

#Preview {
    MapView(locationManager: LocationManager())
}
