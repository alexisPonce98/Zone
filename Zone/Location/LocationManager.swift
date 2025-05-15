//
//  LocationManager.swift
//  Zone
//
//  Created by Alexis Ponce on 5/15/25.
//

import Foundation
import CoreLocation

final class LocationManager: NSObject, ObservableObject {
    @Published var location: CLLocation?

    private let manager = CLLocationManager()

    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
    }

    /// Call this to trigger the permission prompt
    func requestPermission() {
        manager.requestWhenInUseAuthorization()
    }

    /// Call to start one-time or continuous updates
    func startUpdating() {
        manager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(
        _ manager: CLLocationManager,
        didChangeAuthorization status: CLAuthorizationStatus
    ) {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            manager.startUpdatingLocation()
        default:
            break
        }
    }

    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        // grab the most recent
        location = locations.last
    }
}
