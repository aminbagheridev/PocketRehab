//
//  CourseViewModel.swift
//  PocketRehab
//
//  Created by Amin  Bagheri  on 2022-08-11.
//

import Foundation
import CoreData

class CourseViewModel: ObservableObject {
    
    func totalNumberOfCoursesComplete(courses: [Course]) -> Double {
        var completedCourses = 0.0
        let totalCourses = Double(courses.count) * 1.0
        for course in courses {
            if course.isDone == true {
                completedCourses += 1
            }
        }
        print("completedExercises", completedCourses)
        print("totalExercises", totalCourses)
        print(Float(completedCourses / totalCourses))
        return Double(completedCourses / totalCourses)
    }
    
    class Course: NSObject, ObservableObject, Identifiable {
        var id = UUID()
        @Published var imageName: String
        @Published var text: String
        @Published var isDone: Bool
        init(imageName: String, text: String, isDone: Bool) {
            self.imageName = imageName
            self.text = text
            self.isDone = isDone
        }
    }
    
    @Published var courses = [
        Course(imageName: "backPain", text: "Why Back Pain Happens", isDone: false),
        Course(imageName: "shoulderPain", text: "Why Shoulder Pain Happens", isDone: false),
        Course(imageName: "kneePain", text: "Why Knee Pain Happens", isDone: false),
        Course(imageName: "elbowPain", text: "Why Elbow Pain Happens", isDone: false),
        Course(imageName: "wristPain", text: "Why Wrist Pain Happens", isDone: false),
        Course(imageName: "anklePain", text: "Why Ankle Pain Happens", isDone: false),
        Course(imageName: "neckPain", text: "Why Neck Pain Happens", isDone: false)
    ]
}


