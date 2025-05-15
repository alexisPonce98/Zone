//
//  LoadingView.swift
//  Zone
//
//  Created by Alexis Ponce on 4/19/25.
//
import SwiftUI

struct LoadingView: View {
    @State private var progress: CGFloat = 0.0
    @Binding var isFinished: Bool
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 8)
                    .frame(height: 10)
                    .foregroundColor(Color.gray.opacity(0.2))

                RoundedRectangle(cornerRadius: 8)
                    .frame(width: progress, height: 10)
                    .foregroundColor(.blue)
                    .animation(.linear(duration: 3), value: progress)
            }
            .padding(.horizontal)

            Spacer()
        }
        .onAppear {
            // Animate to full width
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                progress = UIScreen.main.bounds.width - 32  // full width with padding

                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    isFinished = true
                }
            }
        }
    }
}
