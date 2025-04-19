//
//  ContentView.swift
//  Zone
//
//  Created by Alexis Ponce on 4/19/25.
//

import SwiftUI

struct LogoSpash: View {
    @State var isFinished = false
    var body: some View {
        VStack {
            if isFinished {
                MainTabBar()
                    .transition(.opacity)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                Spacer()
                Image("ZoneAppIcon")
                    .resizable()
                    .scaledToFit()
                LoadingView(isFinished: $isFinished)
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.3))
    }
}



#Preview {
    LogoSpash()
}
