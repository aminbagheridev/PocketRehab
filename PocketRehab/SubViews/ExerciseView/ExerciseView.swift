//
//  ExerciseView.swift
//  PocketRehab
//
//  Created by Amin  Bagheri  on 2022-07-24.
//

import SwiftUI

struct ExerciseView: View {
    
    @ObservedObject var exercise: WorkoutViewModel.Exercise
    
    var body: some View {
        ZStack {
            
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: UIScreen.main.bounds.width * 0.9, height: 125)
                .foregroundColor(.black)
                .shadow(radius: 10)
            if exercise.isDone {
                Image(exercise.imageName)
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: 125)
                    .cornerRadius(20)
                    .opacity(0.2)
            } else {
                Image(exercise.imageName)
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: 125)
                    .cornerRadius(20)
                
                    .opacity(1)
                    .scaledToFill()
                
            }
            
            if exercise.isDone {
                
            } else {
                HStack(spacing: 0) {
                    Spacer()
                    ZStack {
                        Text(exercise.exerciseName)
                            .font(.system(size: 35, weight: .bold, design: .default))
                        
                            .foregroundColor(.white)
                            .shadow(radius: 4)
                            
                            .shadow(radius: 10)
                            .shadow(radius: 10)
                            .shadow(radius: 10)
                        
                        
                    }
                    Spacer()
                    HStack(spacing: 0) {
                        Image(systemName: "chevron.right")
                            .resizable()
                            .frame(width: 17, height: 25)
                        
                            .foregroundColor(.black)
                            
                            .shadow(radius: 10)
                            .padding(.trailing)
                    }
                    
                    
                    
                }
            }
            
            if exercise.isDone {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                    .foregroundColor(.green)
                    .shadow(radius: 10)
            }
        }.frame(width: UIScreen.main.bounds.width * 0.9, height: 125)
            
            
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(exercise: .init(isDone: false, imageName: "catCow", exerciseName: "Cat Cow"))
    }
}
