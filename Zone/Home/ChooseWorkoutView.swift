//
//  WorkoutView.swift
//  Zone
//
//  Created by Alexis Ponce on 4/19/25.
//
import SwiftUI

struct ChooseWorkoutView: View {
    let items: [HomeRowItem] = [
          .init(icon: "waveform.path.ecg", title: "Fartlek"),
          .init(icon: "heart.fill", title: "Workout Zones"),
          .init(icon: "figure.run", title: "Outdoor Run"),
          .init(icon: "figure.indoor.cycle", title: "Indoor Run")
      ]

    var body: some View {
        NavigationStack {
            List {
                ForEach(items) { item in
                    NavigationLink(destination: MapWithRecordButton(item: item)) {
                        WorktoutOptionView(item: item)
                    }
                }
            }
            .navigationTitle("Choose a workout")
        }
    }
}

struct WorktoutOptionView: View {
    var item: HomeRowItem
    var body: some View {
        HStack {
            Image(systemName: item.icon)
                .foregroundColor(.blue)
            Text(item.title)
        }
    }
}

struct HomeRowItem: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
}
