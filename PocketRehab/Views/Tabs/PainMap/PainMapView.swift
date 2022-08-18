//
//  PainMapView.swift
//  PocketRehab
//
//  Created by Amin  Bagheri  on 2022-07-16.
//

import SwiftUI



struct PainMapView: View {
    
    @State var bodyPart: BodyPart = .front
    @State var imageHeight: Float
    @State var imageWidth: Float
    @State var tappedX: Float
    @State var tappedY: Float
    @StateObject var viewModel: PainMapViewModel = PainMapViewModel()
    @EnvironmentObject var viewRouter: ViewRouter
    @State var showDetailView: Bool = false
    
    //MARK: Detail View Setup
    @State var detailViewTitle: String = "Back Pain Center"
    
    @State var COURSEimageName: String = "backPain"
    @State var COURSEtitle: String = "Why Back Pain Happens,"
    @State var COURSEsubtitle: String? = "and what you can do about it."
    @State var COURSEcardType: CardType = .course
    @State var COURSEisLocked: Bool = false
    
    @State var REHABimageName: String = "backPainRehab"
    @State var REHABtitle: String =
"""
Begin
Back Pain
Rehab
"""
    @State var REHABcourseSubtitle: String? = nil
    @State var REHABcardType: CardType = .exercises
    @State var REHABisLocked: Bool = false
    
    @State var showCourseView: Bool = false
    @State var showWorkoutView: Bool = false
    
    
    @State var workoutTitle: String = ""
    @State var workoutName: WorkoutName = .fiveMinuteMobility
    
    
    func resetToFrontOrBack() {
        if bodyPart == .back || bodyPart == .elbow || bodyPart == .lowerBack || bodyPart == .neck {
            bodyPart = .back
        } else {
            bodyPart = .front
        }
    }
    
    @State var selectionText = ""
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                VStack(spacing: 0){
                    ZStack {
                        if UserDefaults.standard.bool(forKey: "doNotShowInfo") == false {
                            PainMapInfoView()
                                .zIndex(1)
                        }
                        
                        
                        NavigationLink(isActive: $showDetailView) {
                            ScrollView(.vertical, showsIndicators: false) {
                                VStack {
                                    NavigationLink(isActive: $showCourseView) {
                                        
                                        if COURSEimageName == "backPain" {
                                            CourseLiquidSwipeView(course: .backPain)
                                        } else if COURSEimageName == "shoulderPain" {
                                            CourseLiquidSwipeView(course: .shoulderPain)
                                        } else if COURSEimageName == "kneePain" {
                                            CourseLiquidSwipeView(course: .kneePain)
                                        } else if COURSEimageName == "elbowPain" {
                                            CourseLiquidSwipeView(course: .elbowPain)
                                        } else if COURSEimageName == "neckPain" {
                                            CourseLiquidSwipeView(course: .neckPain)
                                        } else if COURSEimageName == "wristPain" {
                                            CourseLiquidSwipeView(course: .wristPain)
                                        } else if COURSEimageName == "anklePain" {
                                            CourseLiquidSwipeView(course: .anklePain)
                                        }
                                    } label: { EmptyView() }
                                    
                                    NavigationLink(isActive: $showWorkoutView) {
                                        
                                        if COURSEimageName == "backPain" {
                                            WorkoutView(VM: WorkoutViewModel(), workoutTitle: "Back Pain Rehab", workout: .backPain)
                                        } else if COURSEimageName == "kneePain" {
                                            WorkoutView(VM: WorkoutViewModel(), workoutTitle: "Knee Pain Rehab", workout: .kneePain)
                                        } else if COURSEimageName == "shoulderPain" {
                                            WorkoutView(VM: WorkoutViewModel(), workoutTitle: "Shoulder Pain Rehab", workout: .shoulderPain)
                                        } else if COURSEimageName == "anklePain" {
                                            WorkoutView(VM: WorkoutViewModel(), workoutTitle: "Ankle Pain Rehab", workout: .anklePain)
                                        } else if COURSEimageName == "neckPain" {
                                            WorkoutView(VM: WorkoutViewModel(), workoutTitle: "Neck Pain Rehab", workout: .neckPain)
                                        } else if COURSEimageName == "wristPain" {
                                            WorkoutView(VM: WorkoutViewModel(), workoutTitle: "Wrist Pain Rehab", workout: .wristPain)
                                        } else if COURSEimageName == "elbowPain" {
                                            WorkoutView(VM: WorkoutViewModel(), workoutTitle: "Elbow Pain Rehab", workout: .elbowPain)
                                        }
                                        
                                    } label: { EmptyView() }
                                    
                                    
                                    Spacer()
                                    // course
                                    HStack {
                                        Text("Course")
                                            .font(.title)
                                            .bold()
                                            .padding(.top)
                                            .padding(.leading, 20)
                                        Spacer()
                                        Rectangle()
                                            .frame(width: 0)
                                    }
                                    
                                    Button {
                                        print("course button pressed")
                                        if COURSEimageName == "backPain" {
                                            showCourseView = true
                                        } else if COURSEimageName == "shoulderPain" {
                                            showCourseView = true
                                        } else if COURSEimageName == "kneePain" {
                                            showCourseView = true
                                        } else if COURSEimageName == "elbowPain" {
                                            showCourseView = true
                                        } else if COURSEimageName == "neckPain" {
                                            showCourseView = true
                                        } else if COURSEimageName == "wristPain" {
                                            showCourseView = true
                                        } else if COURSEimageName == "anklePain" {
                                            showCourseView = true
                                        }
                                        
                                    } label: {
                                        PainMapCourseCardView(imageName: COURSEimageName, title: COURSEtitle, courseSubtitle: COURSEsubtitle, cardType: COURSEcardType, isLocked: COURSEisLocked)
                                    }
                                    Spacer()
                                    // card
                                    HStack {
                                        Text("Rehab")
                                            .font(.title)
                                            .bold()
                                            .padding(.top)
                                        
                                            .padding(.leading, 20)
                                        Spacer()
                                        Rectangle()
                                            .frame(width: 0)
                                    }
                                    Button {
                                        print("rehab button pressed")
                                        showWorkoutView = true
                                    } label: {
                                        PainMapCourseCardView(imageName: REHABimageName, title: REHABtitle, cardType: REHABcardType, isLocked: REHABisLocked)
                                            .onTapGesture {
                                                if REHABimageName == "backPainRehab" {
                                                    workoutName = .backPain
                                                    workoutTitle = REHABtitle
                                                    showWorkoutView = true
                                                } else if REHABimageName == "kneePainRehab" {
                                                    workoutName = .kneePain
                                                    workoutTitle = REHABtitle
                                                    showWorkoutView = true
                                                } else if REHABimageName == "shoulderPainRehab" {
                                                    workoutName = .shoulderPain
                                                    workoutTitle = REHABtitle
                                                    showWorkoutView = true
                                                } else if REHABimageName == "anklePainRehab" {
                                                    workoutName = .anklePain
                                                    workoutTitle = REHABtitle
                                                    showWorkoutView = true
                                                } else if REHABimageName == "neckPainRehab" {
                                                    workoutName = .neckPain
                                                    workoutTitle = REHABtitle
                                                    showWorkoutView = true
                                                } else if REHABimageName == "wristPainRehab" {
                                                    workoutName = .wristPain
                                                    workoutTitle = REHABtitle
                                                    showWorkoutView = true
                                                } else if REHABimageName == "elbowPainRehab" {
                                                    workoutName = .elbowPain
                                                    workoutTitle = REHABtitle
                                                    showWorkoutView = true
                                                    
                                                }
                                            }
                                    }
                                    Spacer()
                                }.navigationBarTitle(detailViewTitle)
                                    .navigationBarTitleDisplayMode(.large)
                            }
                            
                            
                            
                        } label: {
                            EmptyView()
                        }
                        VStack {
                            Picker(selection: $bodyPart) {
                                Text("Front").tag(BodyPart.front)
                                Text("Back").tag(BodyPart.back)
                            } label: {
                                Text("Picker")
                            }
                            .padding(.horizontal)
                            .pickerStyle(.segmented)
                            HStack {
                                //MARK: Selection text based on body part
                                Text(selectionText)
                                    .font(.title)
                                    .bold()
                                
                                Spacer()
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 0, height: 0)
                            }
                            .padding(.leading, 20)
                            GeometryReader { geo in
                                Image(bodyPart.rawValue)
                                //setting image to be resizable and centrered in frame
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                                    .shadow(color: Color("Shadow"), radius: 12)
                                
                                    .animation(.default)
                                //when image is tapped
                                    .gesture(
                                        DragGesture(minimumDistance: 0)
                                            .onEnded {
                                                //print and set the tapped coordinates
                                                print("Tapped image at X:", $0.location.x)
                                                tappedX = Float($0.location.x)
                                                print("Tapped image at Y:", $0.location.y)
                                                tappedY = Float($0.location.y)
                                                
                                                //set the width and height dimensions of the image
                                                print("Width of image: x" , geo.frame(in: .local).width)
                                                imageWidth = Float(geo.frame(in: .local).width)
                                                print("Height of image: ", geo.frame(in: .local).height)
                                                imageHeight = Float(geo.frame(in: .local).height)
                                                
                                                //MARK: CHECK FOR NECK
                                                viewModel.checkForNeck(tappedX: tappedX, tappedY: tappedY, imageWidth: imageWidth, imageHeight: imageHeight)
                                                if viewModel.tappedNeck && bodyPart != .neck {
                                                    self.bodyPart = .neck
                                                } else if viewModel.tappedNeck && bodyPart == .neck {
                                                    setDetailViewToNeck()
                                                } else {
                                                    print("NECK NOT TAPPED")
                                                    //MARK: CHECK FOR SHOULDERS
                                                    viewModel.checkForShoulder(tappedX: tappedX, tappedY: tappedY, imageWidth: imageWidth, imageHeight: imageHeight)
                                                    if viewModel.tappedAShoulder && bodyPart != .shoulder {
                                                        bodyPart = .shoulder
                                                    } else if viewModel.tappedAShoulder && bodyPart == .shoulder {
                                                        setDetailViewToShoulder()
                                                    } else {
                                                        //MARK: CHECK FOR ELBOWS
                                                        viewModel.checkForElbow(tappedX: tappedX, tappedY: tappedY, imageWidth: imageWidth, imageHeight: imageHeight)
                                                        
                                                        if viewModel.tappedElbow && bodyPart != .elbow {
                                                            bodyPart = .elbow
                                                        } else if viewModel.tappedElbow && bodyPart == .elbow {
                                                            setDetailViewToElbow()
                                                            
                                                        } else {
                                                            print("ELBOWS NOT TAPPED")

                                                            //MARK: CHECK FOR KNEE
                                                            if bodyPart != .back &&
                                                                bodyPart != .elbow &&
                                                                bodyPart != .lowerBack &&
                                                                bodyPart != .neck {
                                                                
                                                                viewModel.checkForKnee(tappedX: tappedX, tappedY: tappedY, imageWidth: imageWidth, imageHeight: imageHeight)
                                                            }
                                                            //if knee was tapped, set the image to reflect that. else, revert back to front image.
                                                            if viewModel.tappedKnee && bodyPart != .knee {
                                                                if bodyPart != .back &&
                                                                    bodyPart != .elbow &&
                                                                    bodyPart != .lowerBack &&
                                                                    bodyPart != .neck {
                                                                    self.bodyPart = .knee
                                                                }
                                                            } else if viewModel.tappedKnee && bodyPart == .knee {
                                                                setDetailViewToKnee()
                                                        } else {
                                                            print("KNEE NOT TAPPED")

                                                            //MARK: CHECK FOR ANKLE
                                                            
                                                            viewModel.checkForAnkle(tappedX: tappedX, tappedY: tappedY, imageWidth: imageWidth, imageHeight: imageHeight)
                                                            
                                                            
                                                            if viewModel.tappedAnkle && bodyPart != .ankle {
                                                                bodyPart = .ankle
                                                            } else if viewModel.tappedAnkle && bodyPart == .ankle {
                                                                setDetailViewToAnkle()
                                                            } else {
                                                                print("ANKLE NOT TAPPED")

                                                                //MARK: CHECK FOR WRIST
                                                                viewModel.checkForWrist(tappedX: tappedX, tappedY: tappedY, imageWidth: imageWidth, imageHeight: imageHeight)
                                                                
                                                                if viewModel.tappedWrist && bodyPart != .wrist {
                                                                    bodyPart = .wrist
                                                                } else if viewModel.tappedWrist && bodyPart == .wrist {
                                                                    setDetailViewToWrist()
                                                                    
                                                                } else {
                                                                    print("WRIST NOT TAPPED")

                                                                            //MARK: CHECK FOR LOWER BACK
                                                                            if bodyPart == .front || bodyPart == .shoulder || bodyPart == .knee || bodyPart == .ankle || bodyPart == .wrist {
                                                                                print("body part is frontal")
                                                                            } else {
                                                                                viewModel.checkForLowback(tappedX: tappedX, tappedY: tappedY, imageWidth: imageWidth, imageHeight: imageHeight)
                                                                                print("checking for lower back")
                                                                            }
                                                                            
                                                                            if viewModel.tappedLowerback && bodyPart != .lowerBack {
                                                                                bodyPart = .lowerBack
                                                                                print("Low back tapped 1")
                                                                            } else if viewModel.tappedLowerback && bodyPart == .lowerBack {
                                                                                print("Low back tapped 2")

                                                                                setDetailViewToBack()
                                                                                
                                                                                
                                                                                
                                                                        } else {
                                                                            print("BACK NOT TAPPED")
                                                                            print("Resetting to front or back.")
                                                                            selectionText = "No Selection Made."
                                                                            resetToFrontOrBack()
                                                                            
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                    
                                                }
                                            }
                                    )
                            }
                        }
                        .toolbar {
                            
                            NavigationLink {
                                HelpScreenView()
                            } label: {
                                Label("Help", systemImage: "questionmark.circle")
                                    .foregroundColor(Color("m"))
                            }
                        }
                    }
                    .onChange(of: bodyPart, perform: { newValue in
                        if bodyPart == .shoulder {
                            selectionText = "Shoulders Selected!"
                        } else if bodyPart == .neck {
                            selectionText = "Neck Selected!"
                        } else if bodyPart == .knee {
                            selectionText = "Knees Selected!"
                        } else if bodyPart == .lowerBack {
                            selectionText = "Lowerback Selected!"
                        } else if bodyPart == .ankle {
                            selectionText = "Ankles Selected!"
                        } else if bodyPart == .elbow {
                            selectionText = "Elbows Selected!"
                        } else if bodyPart == .wrist {
                            selectionText = "Wrists Selected!"
                        }
                    })
                    .navigationBarTitleDisplayMode(.large)
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
                .navigationTitle("Pain Map")
                
                .accentColor(.black)
            }
        }
    }
    
    //MARK: Detail View Functions
    func setDetailViewToNeck() {
        detailViewTitle = "Neck Pain Center"
        
        COURSEimageName = "neckPain"
        COURSEtitle = "Why Neck Pain Happens,"
        COURSEsubtitle = "and what you can do about it."
        COURSEcardType = .course
        COURSEisLocked = false
        
        REHABimageName = "neckPainRehab"
        REHABtitle =
    """
    Begin
    Neck Pain
    Rehab
    """
        REHABcourseSubtitle = nil
        REHABcardType = .exercises
        REHABisLocked = false
        showDetailView = true
    }
    func setDetailViewToShoulder() {
        detailViewTitle = "Shoulder Pain Center"
        
        COURSEimageName = "shoulderPain"
        COURSEtitle = "Why Shoulder Pain Happens,"
        COURSEsubtitle = "and what you can do about it."
        COURSEcardType = .course
        COURSEisLocked = false
        
        REHABimageName = "shoulderPainRehab"
        REHABtitle =
    """
    Begin
    Shoulder Pain
    Rehab
    """
        REHABcourseSubtitle = nil
        REHABcardType = .exercises
        REHABisLocked = false
        showDetailView = true
    }
    func setDetailViewToBack() {
        detailViewTitle = "Back Pain Center"
        
        COURSEimageName = "backPain"
        COURSEtitle = "Why Back Pain Happens,"
        COURSEsubtitle = "and what you can do about it."
        COURSEcardType = .course
        COURSEisLocked = false
        
        REHABimageName = "backPainRehab"
        REHABtitle =
    """
    Begin
    Back Pain
    Rehab
    """
        REHABcourseSubtitle = nil
        REHABcardType = .exercises
        REHABisLocked = false
        showDetailView = true
    }
    func setDetailViewToAnkle() {
        detailViewTitle = "Ankle Pain Center"
        
        COURSEimageName = "anklePain"
        COURSEtitle = "Why Ankle Pain Happens,"
        COURSEsubtitle = "and what you can do about it."
        COURSEcardType = .course
        COURSEisLocked = false
        
        REHABimageName = "anklePainRehab"
        REHABtitle =
    """
    Begin
    Ankle Pain
    Rehab
    """
        REHABcourseSubtitle = nil
        REHABcardType = .exercises
        REHABisLocked = false
        showDetailView = true
    }
    
    func setDetailViewToWrist() {
        detailViewTitle = "Wrist Pain Center"
        
        COURSEimageName = "wristPain"
        COURSEtitle = "Why Wrist Pain Happens,"
        COURSEsubtitle = "and what you can do about it."
        COURSEcardType = .course
        COURSEisLocked = false
        
        REHABimageName = "wristPainRehab"
        REHABtitle =
    """
    Begin
    Wrist Pain
    Rehab
    """
        REHABcourseSubtitle = nil
        REHABcardType = .exercises
        REHABisLocked = false
        showDetailView = true
    }
    func setDetailViewToKnee() {
        detailViewTitle = "Knee Pain Center"
        
        COURSEimageName = "kneePain"
        COURSEtitle = "Why Knee Pain Happens,"
        COURSEsubtitle = "and what you can do about it."
        COURSEcardType = .course
        COURSEisLocked = false
        
        REHABimageName = "kneePainRehab"
        REHABtitle =
    """
    Begin
    Knee Pain
    Rehab
    """
        REHABcourseSubtitle = nil
        REHABcardType = .exercises
        REHABisLocked = false
        showDetailView = true
    }
    func setDetailViewToElbow() {
        detailViewTitle = "Elbow Pain Center"
        
        COURSEimageName = "elbowPain"
        COURSEtitle = "Why Elbow Pain Happens,"
        COURSEsubtitle = "and what you can do about it."
        COURSEcardType = .course
        COURSEisLocked = false
        
        REHABimageName = "elbowPainRehab"
        REHABtitle =
    """
    Begin
    Elbow Pain
    Rehab
    """
        REHABcourseSubtitle = nil
        REHABcardType = .exercises
        REHABisLocked = false
        showDetailView = true
    }
}
