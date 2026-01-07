//
//  PedometerView.swift
//  StepCounter
//
//  Created by Muhammad Ubaid on 02/01/2026.
//
import SwiftUI

struct PedometerScreen: View {
    
    @ObservedObject var viewModel: PedometerViewModel
    
    var body: some View {
        VStack(spacing: .zero) {
            HStack {
                Text("Today's Activity")
                    .font(.largeTitle).fontWeight(.bold)
                Spacer()
            }
            Spacer()
                .frame(maxHeight: 72)
            Text("\(viewModel.steps)")
                .font(.system(size: 72, weight: .semibold))
                .monospaced()
                .accessibilityIdentifier("stepsLabel")
            HStack {
                Text("Steps")
                Image("sneaker")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 24, maxHeight: 24)
                
            }
            Spacer()
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.init("Background"))
        .foregroundStyle(.white)
        .onAppear { viewModel.start() }
        .onDisappear { viewModel.stop() }
    }
}

#Preview {
    PedometerScreen(
        viewModel: PedometerViewModel(
            repository: FakePedometerRepository()
        )
    )
}
