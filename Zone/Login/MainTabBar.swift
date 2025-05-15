//
//  ChooseWorkoutView.swift
//  Zone
//
//  Created by Alexis Ponce on 4/19/25.
//

import SwiftUI

struct MainTabBar: View {
    var body: some View {
        TabView {
            Tab {
                ChooseWorkoutView()
            } label: {
                Label("Workout", systemImage: "house")
            }

            Tab {
                ActivityView()
            } label: {
                Label("Activity", systemImage: "chart.bar")
            }
        }
    }
}

struct ActivityView: View {
    var body: some View {
        Text("Activity")
    }
}

#Preview {
    MainTabBar()
}
