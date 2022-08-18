//
//  CourseView.swift
//  PocketRehab
//
//  Created by Amin  Bagheri  on 2022-07-18.
//

import SwiftUI

struct CourseView: View {

    @ObservedObject var course: CourseViewModel.Course
    var body: some View {
        if course.isDone == false {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(height: 100)
                    .frame(width: UIScreen.main.bounds.width * 0.9)
                    .foregroundColor(Color("b"))
                    .shadow(color: Color("Shadow"), radius: 15)

                HStack {
                    Image("\(course.imageName)")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(10)
                    Text(course.text)
                        .frame(minWidth: 0, idealWidth: 244, maxWidth: 250, minHeight: 30, idealHeight: 31, maxHeight: 70)
                        .font(.system(size: 24, weight: .bold, design: .default))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color("m"))
                    Button {
                        
                    } label: {
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color("m"))
                    }

                    
                }
                .frame(width: UIScreen.main.bounds.width * 0.8)
            }
            .frame(height: 100)
            .frame(width: UIScreen.main.bounds.width * 0.9)
        } else {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(height: 100)
                    .frame(width: UIScreen.main.bounds.width * 0.9)

                    .foregroundColor(Color("b"))
                    .shadow(color: Color("Shadow"), radius: 10)


                HStack {
                    Image("\(course.imageName)")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(10)
                    Text(course.text)
                        .frame(minWidth: 0, idealWidth: 244, maxWidth: 250, minHeight: 30, idealHeight: 20, maxHeight: 70)
                        .font(.system(size: 22, weight: .bold, design: .default))
                        .multilineTextAlignment(.leading)
                    Button {
                        
                    } label: {
                        Image(systemName: "chevron.right")
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 20, height: 25)
                        
                            .foregroundColor(Color("m"))

                    }

                    
                }
                .opacity(0.2)
                .frame(width: UIScreen.main.bounds.width * 0.8)
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.green)
                    .shadow(radius: 20)

            }
            .frame(height: 100)
            .frame(width: UIScreen.main.bounds.width * 0.9)
        }
        
    }
}
