//
//  DetailView.swift
//  Zone
//
//  Created by Alexis Ponce on 5/15/25.
//
import SwiftUI
import MapKit

struct WorkoutView: View {
    
    @StateObject var locationManager = LocationManager()
    var item: HomeRowItem

    var body: some View {
        ZStack(alignment: .bottom) {
            MapView(locationManager: locationManager)
            // record button
            Button(action: {
                locationManager.isRecording.toggle()
            }) {
                Image(systemName: locationManager.isRecording ? "pause.fill" : "play.fill")
                  // ← use whichever font size or dynamic type style you like
                  .font(.title2)
                  .padding(12)                         // padding around the symbol
                  .background(
                    Circle()
                      .fill(locationManager.isRecording ? .red : .green)
                      .shadow(radius: 4)
                  )
                  .foregroundColor(.white)
            }
            .padding(.bottom, 24)
        }
        .navigationTitle(item.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MapWithRecordButton_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView(item: .init(icon: "", title: "Outdoor Workout"))
    }
}
