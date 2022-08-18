//
//  RoutinesView.swift
//  PocketRehab
//
//  Created by Amin  Bagheri  on 2022-07-18.
//

import SwiftUI
import ScalingHeaderScrollView

struct RoutinesView: View {
    @State var showRoutine = false
    @State var showWeightedRoutine = false
    @State var workoutTitle: String = ""
    @State var workoutName: WorkoutName = .fiveMinuteMobility
    //TODO: Add cool effect for scrolling from exyte
    @EnvironmentObject var viewRouter: ViewRouter
    
    let preWorkoutWarmups = [
        RoutineView(image: Image("upper"), text: "Upper Body Mobility"),
        RoutineView(image: Image("legs"), text: "Legs Day Mobility"),
        RoutineView(image: Image("deadlifts"), text: "Deadlifting Mobility"),
        RoutineView(image: Image("shoulders"), text: "Shoulders Mobility")
    ]
    let badPostureRoutines = [
        RoutineView(image: Image("badHeadPosture"), text: "Neck Posture"),
        RoutineView(image: Image("badBackPosture"), text: "Low-Back Posture")
    ]
    let morningRoutines = [
        RoutineView(image: Image("morningMobility1"), text: "Beginner Mobility"), RoutineView(image: Image("morningMobility2"), text: "Intermediate Mobility"), RoutineView(image: Image("morningMobility3"), text: "Advanced Mobility")
    ]
    
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                VStack(spacing: 0){
                    
                    ScrollView {
                        VStack(spacing: 10) {
                            NavigationLink(destination: WorkoutView(VM: WorkoutViewModel(), workoutTitle: workoutTitle, workout: workoutName), isActive: $showRoutine) { EmptyView() }
                            
                            //MARK: MORNING MOBILITY
                            VStack {
                                VStack {
                                    HStack {
                                        Text("Perfect to do in the morning! (Or anytime!)")
                                            .font(.title)
                                            .bold()
                                            .padding(.top)
                                            .padding(.horizontal)
                                            .padding(.bottom)
                                        Spacer()
                                        Rectangle()
                                            .frame(width: 1, height: 1, alignment: .center)
                                        
                                        
                                    }
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack {
                                            ForEach(morningRoutines, id: \.self) { routine in
                                                routine
                                                    .padding(.horizontal, 5)
                                                    .onTapGesture {
                                                        if routine.image == Image("morningMobility1") {
                                                            workoutName = .fiveMinuteMobility
                                                            
                                                            workoutTitle = "Beginner Routine"
                                                            showRoutine = true
                                                        } else if routine.image == Image("morningMobility2") {
                                                            workoutName = .tenMinuteMobility
                                                            
                                                            workoutTitle = "Intermediate Routine"
                                                            showRoutine = true
                                                        } else if routine.image == Image("morningMobility3") {
                                                            workoutName = .fifteenMinuteMobility
                                                            
                                                            workoutTitle = "Advanced Routine"
                                                            showRoutine = true
                                                        }
                                                    }
                                            }
                                            
                                        }
                                    }
                                    
                                } // General mobility exercises
                                VStack {
                                    
                                    HStack {
                                        Text("Exercise specific warmups!")
                                            .font(.title)
                                            .bold()
                                            .padding()
                                        Spacer()
                                        Rectangle()
                                            .frame(width: 1, height: 1, alignment: .center)
                                        
                                        
                                    }
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack {
                                            ForEach(preWorkoutWarmups, id: \.self) { routine in
                                                routine
                                                    .padding(.horizontal, 5)
                                                    .onTapGesture {
                                                        if routine.image == Image("upper") {
                                                            workoutName = .upperBodyMobility
                                                            
                                                            workoutTitle = "Upper Body Mobility"
                                                            showRoutine = true
                                                        } else if routine.image == Image("legs") {
                                                            workoutName = .legsDayMobility
                                                            
                                                            workoutTitle = "Leg Day Mobility"
                                                            showRoutine = true
                                                        } else if routine.image == Image("deadlifts") {
                                                            workoutName = .deadliftingMobility
                                                            
                                                            workoutTitle = "Deadlifting Mobility"
                                                            showRoutine = true
                                                        } else if routine.image == Image("shoulders") {
                                                            workoutName = .shouldersMobility
                                                            
                                                            workoutTitle = "Shoulders Mobility"
                                                            showRoutine = true
                                                        }
                                                    }
                                            }
                                        }
                                        
                                    }
                                } // Exercise specific warmups
                                VStack {
                                    
                                    HStack {
                                        Text("Fix bad posture!")
                                            .font(.title)
                                            .bold()
                                            .padding()
                                        Spacer()
                                        Rectangle()
                                            .frame(width: 1, height: 1, alignment: .center)
                                        
                                        
                                    }
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack {
                                            ForEach(badPostureRoutines, id: \.self) { routine in
                                                routine
                                                    .padding(.horizontal, 5)
                                                    .onTapGesture {
                                                        if routine.image == Image("badHeadPosture") {
                                                            workoutName = .neckPosture
                                                            
                                                            workoutTitle = "Neck Posture Routine"
                                                            showRoutine = true
                                                        } else if routine.image == Image("badBackPosture") {
                                                            workoutName = .backPosture
                                                            
                                                            workoutTitle = "Back Posture Routine"
                                                            showRoutine = true
                                                        }
                                                    }
                                            }
                                        }
                                        
                                    }
                                } // Exercise specific warmups
                                
                                
                        }
                        .padding(.leading, 20)
                        .background(Color.clear)
                        
                        .edgesIgnoringSafeArea(.leading)
                        .navigationTitle("Routines")
                        .navigationBarTitleDisplayMode(.large)
                        
                        
                    }
                    
                }
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
            
            
            
            
        }
    }
}
}
struct RoutinesView_Previews: PreviewProvider {
    static var previews: some View {
        RoutinesView()
    }
}
