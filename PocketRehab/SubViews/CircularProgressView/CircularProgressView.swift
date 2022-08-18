//
//  CircularProgressView.swift
//  PocketRehab
//
//  Created by Amin  Bagheri  on 2022-07-19.
//

import SwiftUI

struct CircularProgressView: View {
    @Binding var progress: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 25)
                .opacity(0.3)
                .foregroundColor(Color.blue)
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 25, lineCap: .round, lineJoin: .bevel))
                .fill(
                    AngularGradient(gradient: Gradient(colors: [.blue.opacity(0.7), .purple, .purple, .blue.opacity(0.7)]), center: .center, startAngle: .zero, endAngle: .degrees(360))
                   )              .rotationEffect(Angle(degrees: 270.0))
            VStack {
                Text(String(format: "%.0f %%", min(self.progress, 1.0)*100.0))
                    .font(.system(size: 27, weight: .bold, design: .default))
//                Text("Completion")
//                    .font(.system(size: 20, weight: .bold, design: .default))
                
                
            }
        }
    }
}

struct CourseCircularProgressView: View {
    @Binding var progress: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 25)
                .opacity(0.3)
                .foregroundColor(Color.blue)
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 25, lineCap: .round, lineJoin: .bevel))
                .fill(
                    AngularGradient(gradient: Gradient(colors: [.blue.opacity(0.7), .purple, .purple, .blue.opacity(0.7)]), center: .center, startAngle: .zero, endAngle: .degrees(360))
                   )              .rotationEffect(Angle(degrees: 270.0))
            VStack {
                Text(String(format: "%.0f %%", min(self.progress, 1.0)*100.0))
                    .font(.system(size: 27, weight: .bold, design: .default))
                Text("Course Completion")
                    .font(.system(size: 20, weight: .bold, design: .default))
                
                
            }
        }
    }
}
