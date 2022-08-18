//
//  CoursesView.swift
//  PocketRehab
//
//  Created by Amin  Bagheri  on 2022-07-18.
//

import SwiftUI

struct CoursesView: View {
    
    @StateObject var VM = CourseViewModel()
    @AppStorage("progressValue") var saveProgressValue = 0.0
    @EnvironmentObject var viewRouter: ViewRouter
    @State var showingCourse = false
    @State var courseType: Courses = .backPain
    @State var showHelpPopup = false
    

    var body: some View {
        GeometryReader { geometry in
            
            NavigationView {
                VStack(spacing: 0){
                    ScrollView {
                        NavigationLink(isActive: $showingCourse) {
                            if courseType == .backPain {
                                CourseLiquidSwipeView(course: .backPain)
                            } else if courseType == .kneePain {
                                CourseLiquidSwipeView(course: .kneePain)
                            } else if courseType == .shoulderPain {
                                CourseLiquidSwipeView(course: .shoulderPain)
                            } else if courseType == .neckPain {
                                CourseLiquidSwipeView(course: .neckPain)
                            } else if courseType == .wristPain {
                                CourseLiquidSwipeView(course: .wristPain)
                            } else if courseType == .anklePain {
                                CourseLiquidSwipeView(course: .anklePain)
                            } else if courseType == .elbowPain {
                                CourseLiquidSwipeView(course: .elbowPain)
                            }
                        } label: {
                            EmptyView()
                        }
                        
                        VStack {
                            //Pay attention to the following line which passes a reference to the progressValue binding from ContentView to the ProgressBar view:
                            CourseCircularProgressView(progress: $saveProgressValue)
                                .frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.width * 0.6)
                                .padding(.all, 20)
                                .animation(.default)
                            VStack {
                                ForEach(VM.courses) { course in
                                    CourseView(course: course)
                                        .animation(.easeInOut)
                                        .padding(.vertical, 10)
                                        .onTapGesture {
                                            showCourseView(tappedCourse: course)
                                        }
                                        .gesture(DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
                                            .onEnded { value in
                                                print(value.translation)
                                                switch(value.translation.width, value.translation.height) {
                                                case (...0, -50...50):
                                                    print("left")
completeCourse(tappedCourse: course)
                                                case (0..., -50...50):
                                                    print("right")
                                                    completeCourse(tappedCourse: course)
                                                case (-100...100, ...0):  print("up swipe")
                                                case (-100...100, 0...):  print("down swipe")
                                                default:  print("no clue")
                                                }
                                            }
                                        )
                                }
                            }
                            .edgesIgnoringSafeArea(.horizontal)
                            .frame(width: UIScreen.main.bounds.width)

                        }
                        .edgesIgnoringSafeArea(.horizontal)
                        .frame(width: UIScreen.main.bounds.width)

                        
                    }
                    .edgesIgnoringSafeArea(.horizontal)
                    .frame(width: UIScreen.main.bounds.width)
                    .navigationTitle("Courses")
                    .navigationBarTitleDisplayMode(.large)
                    .navigationBarItems(trailing:
                                            Button(action: {
                        showHelpPopup = true
                    }) {
                        Image(systemName: "questionmark.circle")
                            .foregroundColor(Color("m"))
                        
                    }
                    )
                        
                    HStack {
                        TabBarIcon(width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "person.crop.circle", tabName: "Home", viewRouter: viewRouter, currentView: .home)
                        TabBarIcon(width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "figure.stand", tabName: "Pain Map", viewRouter: viewRouter, currentView: .painMap)
                        TabBarIcon(width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "repeat", tabName: "Routines", viewRouter: viewRouter, currentView: .routines)
                        TabBarIcon(width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "brain.head.profile", tabName: "Courses", viewRouter: viewRouter, currentView: .courses)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height/8)
                    .background(Color("TabBarBackground").shadow(radius: 2))
                }
                .edgesIgnoringSafeArea(.bottom)
                .edgesIgnoringSafeArea(.horizontal)
                .frame(width: UIScreen.main.bounds.width)
            }
        }
        
        
        .onAppear {
            if backTapped {
                VM.courses[0].isDone = true
            }
            if shoulderTapped {
                VM.courses[1].isDone = true
            }
            if kneeTapped {
                VM.courses[2].isDone = true
            }
            if elbowTapped {
                VM.courses[3].isDone = true
            }
            if wristTapped {
                VM.courses[4].isDone = true
            }
            if ankleTapped {
                VM.courses[5].isDone = true
            }
            if neckTapped {
                VM.courses[6].isDone = true
            }
        }
        .popup(isPresented: $showHelpPopup, type: .default, animation: .easeInOut, autohideIn: 99999999, dragToDismiss: true, closeOnTap: true, closeOnTapOutside: true, backgroundColor: .clear) {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.width * 0.8)
                    .foregroundColor(Color("b"))
                    .shadow(color: .gray, radius: 20, x: 0, y: 0)
                VStack {
                    HStack {
                        Rectangle()
                            .frame(width: 0, height: 0)
                        Spacer()
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .padding(.trailing, 30)
                        
                    }
                    .padding(.top, 30)
                    Spacer()
                    Text("To start a course:")
                        .font(.title)
                        .bold()
                    Text("Tap on any course.")
                        .font(.system(size: 18, weight: .medium, design: .default))
                        .padding(.top, 1)
                        .padding(.bottom, 5)
                    Text("To mark as complete:")
                        .font(.title)
                        .bold()
                    Text("Swipe right or left on any course.")
                        .font(.system(size: 18, weight: .medium, design: .default))
                        .padding(.top, 1)
                    Spacer()
                    
                    HStack {
                        Image(systemName: "checkmark.square")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.init(red: 0.2, green: 0, blue: 1))
                        Text("Do not show again...")
                            .foregroundColor(.init(red: 0.2, green: 0, blue: 1))
                        
                        
                    }
                    .padding(.bottom, 30)
                    .gesture(
                        TapGesture()
                            .onEnded { _ in
                                showHelpPopup = false
                                UserDefaults.standard.set(true, forKey: "noHelpNeeded")
                            }
                        
                    )
                }
            }.frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.width * 0.8)
            
        }
    }
        
    func showCourseView(tappedCourse: CourseViewModel.Course) {
        if tappedCourse.imageName == "backPain" {
            courseType = .backPain
            showingCourse = true
        } else if tappedCourse.imageName == "elbowPain" {
            courseType = .elbowPain
            showingCourse = true
        } else if tappedCourse.imageName == "kneePain" {
            courseType = .kneePain
            showingCourse = true
        } else if tappedCourse.imageName == "wristPain" {
            courseType = .wristPain
            showingCourse = true
        } else if tappedCourse.imageName == "shoulderPain" {
            courseType = .shoulderPain
            showingCourse = true
        } else if tappedCourse.imageName == "neckPain" {
            courseType = .neckPain
            showingCourse = true
        } else if tappedCourse.imageName == "anklePain" {
            courseType = .anklePain
            showingCourse = true
        }
    }
    
    func completeCourse(tappedCourse: CourseViewModel.Course) {
        toggleCheck(tappedCourse)
        saveProgressValue = VM.totalNumberOfCoursesComplete(courses: VM.courses)
    }
    func toggleCheck(_ tappedCourse: CourseViewModel.Course) {
        let index = VM.courses.firstIndex { course in
            course.id == tappedCourse.id
        }
        VM.courses[index!].isDone.toggle()
        if tappedCourse.imageName == "backPain" {
            backTapped = VM.courses[index!].isDone
        } else if tappedCourse.imageName == "elbowPain" {
            elbowTapped = VM.courses[index!].isDone
        } else if tappedCourse.imageName == "shoulderPain" {
            shoulderTapped = VM.courses[index!].isDone
        } else if tappedCourse.imageName == "wristPain" {
            wristTapped = VM.courses[index!].isDone
        } else if tappedCourse.imageName == "anklePain" {
            ankleTapped = VM.courses[index!].isDone
        } else if tappedCourse.imageName == "neckPain" {
            neckTapped = VM.courses[index!].isDone
        } else if tappedCourse.imageName == "kneePain" {
            kneeTapped = VM.courses[index!].isDone
        }
     }
    
    @AppStorage("back") var backTapped = false
    @AppStorage("elbow") var elbowTapped = false
    @AppStorage("shoulder") var shoulderTapped = false
    @AppStorage("wrist") var wristTapped = false
    @AppStorage("ankle") var ankleTapped = false
    @AppStorage("neck") var neckTapped = false
    @AppStorage("knee") var kneeTapped = false
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
            .previewInterfaceOrientation(.portrait)
        
    }
}
