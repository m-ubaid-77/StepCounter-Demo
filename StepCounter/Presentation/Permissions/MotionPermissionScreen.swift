//
//  Untitled.swift
//  StepCounter
//
//  Created by Muhammad Ubaid on 06/01/2026.
//
import SwiftUI

struct MotionPermissionScreen: View {
    
    @ObservedObject var viewModel: MotionPermissionViewModel
    
    var body: some View {
        VStack {
            Spacer().frame(maxHeight: 48)
            VStack(alignment: .center, spacing: 24) {
                Text("Enable Motion access")
                    .font(.largeTitle).fontWeight(.bold)
                    
                Text("This helps you monitor your activity and stay motivated every day.")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                
                Image("footSteps")
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(0.4, contentMode: .fit)
                    .padding(.top, 48)
                
            }
            .padding(.horizontal)
            
            Spacer()
            
            Button(action: {
                Task {
                    await viewModel.allowAccessButtonPressed()
                }
            }, label: {
            
                Text("Allow Access")
                    .font(.title2).fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white.opacity(0.5))
                    .foregroundColor(.white)
                
                    .cornerRadius(10)
            })
            .padding(.horizontal)
            .padding(.bottom, 32)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.init("Background"))
        .foregroundStyle(.white)
    }
}


#Preview {
    MotionPermissionScreen(viewModel: AppDIContainer.shared.resolve(MotionPermissionViewModel.self))
}
