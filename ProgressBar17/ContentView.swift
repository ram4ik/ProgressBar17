//
//  ContentView.swift
//  ProgressBar17
//
//  Created by Ramill Ibragimov on 14.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showProgress = false
    @State private var degree: Int = 270
    @State private var progressLen = 0.8
    @State private var colorIndex = 0
    
    private var colors = [Color.red, .green, .blue, .orange]
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                if showProgress {
                    Circle()
                        .trim(from: 0.0, to: progressLen)
                        .stroke(LinearGradient(colors: [colors[colorIndex], colors[colorIndex].opacity(0.6)],
                                               startPoint: .topLeading,
                                               endPoint: .bottomTrailing),
                                style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                        .animation(.easeIn(duration: 1.5).repeatForever(autoreverses: true), value: progressLen)
                        .frame(width: 80, height: 80)
                        .rotationEffect(Angle(degrees: Double(degree)))
                        .animation(.linear(duration: 0.5).repeatForever(autoreverses: false), value: degree)
                        .onAppear() {
                            degree = 270 + 360
                            progressLen = 0
                            colorIndex += 1
                            colorIndex = colorIndex % colors.count
                        }
                }
                Spacer()
                
                Button {
                    showProgress.toggle()
                } label: {
                    Text("Show")
                }
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle("SwiftUI ProgressBar")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
