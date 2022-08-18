//
//  WorkoutView.swift
//  PocketRehab
//
//  Created by Amin  Bagheri  on 2022-07-24.
//

import SwiftUI
import ExytePopupView

struct WorkoutView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var VM: WorkoutViewModel
    
    @State var workoutTitle: String
    @State var workout: WorkoutName
    @State var showHelpPopup: Bool = false
    @State var workoutProgress: Double = 0
    @State var showCompletePopup: Bool = false
    @AppStorage("numberOfSessionsComplete") var numberOfSessionsComplete: Int = 1
    
    
    //MARK: DETAIL VIEW
    @State private var isShowingDetailView = false
    @State var videoUrl: URL = Bundle.main.url(forResource: "standingLatStretch", withExtension: "mp4")!
    @State var detailWorkoutTitle: String = "Standing Lat Stretch"
    @State var recommendedReps: String = "10 times on each side."
    
    func showDetailView(tappedExercise: WorkoutViewModel.Exercise) {
        if workout == .elbowPain {
            //Getting the index of the exercise that was tapped
            let i = VM.elbowPainExercises.firstIndex { exercise in
                exercise.id == tappedExercise.id
            }
            print(i)
            if VM.elbowPainExercises[i!].imageName == "farmersWalks" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "farmersWalks", withExtension: "mp4")!
                detailWorkoutTitle = "Farmers Walks"
                recommendedReps = "3 one-minute walks."
                isShowingDetailView = true
            } else if VM.elbowPainExercises[i!].imageName == "wristFlexorStretch" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "wristFlexorStretch", withExtension: "mp4")!
                detailWorkoutTitle = "Wrist Flexor Stretch"
                recommendedReps = "10 times with 5 second hold."
                isShowingDetailView = true
            } else if VM.elbowPainExercises[i!].imageName == "wristExtensorStretch" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "wristExtensorStretch", withExtension: "mp4")!
                detailWorkoutTitle = "Wrist Extensor Stretch"
                recommendedReps = "10 times with 5 second hold."
                isShowingDetailView = true
            } else if VM.elbowPainExercises[i!].imageName == "wristCurl" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "wristCurl", withExtension: "mp4")!
                detailWorkoutTitle = "Wrist Curl"
                recommendedReps = "10 times."
                isShowingDetailView = true
            } else if VM.elbowPainExercises[i!].imageName == "reverseWristCurl" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "reverseWristCurl", withExtension: "mp4")!
                detailWorkoutTitle = "Reverse Wrist Curl"
                recommendedReps = "10 times."
                isShowingDetailView = true
            } else if VM.elbowPainExercises[i!].imageName == "scapulaPullup" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "scapulaPullup", withExtension: "mov")!
                detailWorkoutTitle = "Scapular Pullups"
                recommendedReps = "10 times."
                isShowingDetailView = true
            } else if VM.elbowPainExercises[i!].imageName == "facepull" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "facepull", withExtension: "mov")!
                detailWorkoutTitle = "Facepulls"
                recommendedReps = "10 times."
                isShowingDetailView = true
            }
        } else if workout == .wristPain {
            //Getting the index of the exercise that was tapped
            let i = VM.wristPainExercises.firstIndex { exercise in
                exercise.id == tappedExercise.id
            }
            print(i)
            if VM.wristPainExercises[i!].imageName == "wristCircles" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "wristCircles", withExtension: "mp4")!
                detailWorkoutTitle = "Wrist Circles"
                recommendedReps = "Complete the full movement 10 time."
                isShowingDetailView = true
            } else if VM.wristPainExercises[i!].imageName == "wristFlexorStretch" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "wristFlexorStretch", withExtension: "mp4")!
                detailWorkoutTitle = "Wrist Flexor Stretch"
                recommendedReps = "10 times with 5 second hold."
                isShowingDetailView = true
            } else if VM.wristPainExercises[i!].imageName == "wristExtensorStretch" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "wristExtensorStretch", withExtension: "mp4")!
                detailWorkoutTitle = "Wrist Extensor Stretch"
                recommendedReps = "10 times with 5 second hold."
                isShowingDetailView = true
            } else if VM.wristPainExercises[i!].imageName == "wristCurl" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "wristCurl", withExtension: "mp4")!
                detailWorkoutTitle = "Wrist Curl"
                recommendedReps = "10 times."
                isShowingDetailView = true
            } else if VM.wristPainExercises[i!].imageName == "reverseWristCurl" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "reverseWristCurl", withExtension: "mp4")!
                detailWorkoutTitle = "Reverse Wrist Curl"
                recommendedReps = "10 times."
                isShowingDetailView = true
            } else if VM.wristPainExercises[i!].imageName == "wristPronationSupination" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "wristPronationSupination", withExtension: "mov")!
                detailWorkoutTitle = "Wrist Pronation and Supination"
                recommendedReps = "10 times."
                isShowingDetailView = true
            } else if VM.wristPainExercises[i!].imageName == "radialUlnarDeviation" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "radialUlnarDeviation", withExtension: "mov")!
                detailWorkoutTitle = "Radial / Ulnar Deviation"
                recommendedReps = "10 times."
                isShowingDetailView = true
            }
        } else if workout == .neckPain {
            //Getting the index of the exercise that was tapped
            let i = VM.neckPainExercises.firstIndex { exercise in
                exercise.id == tappedExercise.id
            }
            print(i)
            if VM.neckPainExercises[i!].imageName == "neckUpDownLeftRight" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "neckUpDownLeftRight", withExtension: "mp4")!
                detailWorkoutTitle = "Quad-Directional Neck Movementss"
                recommendedReps = "Complete the full movement 10 time."
                isShowingDetailView = true
            } else if VM.neckPainExercises[i!].imageName == "neckSideToSide" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "neckSideToSide", withExtension: "mp4")!
                detailWorkoutTitle = "Side To Side Neck Motion"
                recommendedReps = "Full movement 10 times."
                isShowingDetailView = true
            } else if VM.neckPainExercises[i!].imageName == "neckIsometrics" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "neckIsometrics", withExtension: "mov")!
                detailWorkoutTitle = "Neck Isometrics"
                recommendedReps = "Do each isometric hold 10 times, holding each for 5 seconds."
                isShowingDetailView = true
            } else if VM.neckPainExercises[i!].imageName == "chinTucks" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "chinTucks", withExtension: "mp4")!
                detailWorkoutTitle = "Chin Tucks"
                recommendedReps = "15 times with 2 second hold."
                isShowingDetailView = true
            } else if VM.neckPainExercises[i!].imageName == "facepull" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "facepull", withExtension: "mp4")!
                detailWorkoutTitle = "Face Pulls"
                recommendedReps = "10 times."
                isShowingDetailView = true
            } else if VM.neckPainExercises[i!].imageName == "bandPullApart" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "bandPullApart", withExtension: "mp4")!
                detailWorkoutTitle = "Band Pull Aparts"
                recommendedReps = "10 times."
                isShowingDetailView = true
            }
        } else if workout == .anklePain {
            //Getting the index of the exercise that was tapped
            let i = VM.anklePainExercises.firstIndex { exercise in
                exercise.id == tappedExercise.id
            }
            print(i)
            if VM.anklePainExercises[i!].imageName == "calfRolling" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "calfRolling", withExtension: "mp4")!
                detailWorkoutTitle = "Calf Rolling"
                recommendedReps = "10 times on each leg."
                isShowingDetailView = true
            } else if VM.anklePainExercises[i!].imageName == "calfStretch" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "calfStretch", withExtension: "mp4")!
                detailWorkoutTitle = "Calf Stretching"
                recommendedReps = "3 times with 10 second hold on each leg."
                isShowingDetailView = true
            } else if VM.anklePainExercises[i!].imageName == "soleusStretch" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "soleusStretch", withExtension: "mp4")!
                detailWorkoutTitle = "Soleus Stretching"
                recommendedReps = "3 times with 10 second hold on each leg."
                isShowingDetailView = true
            } else if VM.anklePainExercises[i!].imageName == "calfRaise" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "calfRaise", withExtension: "mp4")!
                detailWorkoutTitle = "Calf Raises"
                recommendedReps = "10 slow raises on each leg."
                isShowingDetailView = true
            } else if VM.anklePainExercises[i!].imageName == "ankleDorsiflexion" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "ankleDorsiflexion", withExtension: "mp4")!
                detailWorkoutTitle = "Ankle Dorsiflexion"
                recommendedReps = "10 times on each leg."
                isShowingDetailView = true
            } else if VM.anklePainExercises[i!].imageName == "anklePlantarflexion" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "anklePlantarflexion", withExtension: "mp4")!
                detailWorkoutTitle = "Ankle Plantarflexion"
                recommendedReps = "10 times on each leg."
                isShowingDetailView = true
            } else if VM.anklePainExercises[i!].imageName == "ankleInversion" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "ankleInversion", withExtension: "mp4")!
                detailWorkoutTitle = "Ankle Inversion"
                recommendedReps = "10 times on each leg."
                isShowingDetailView = true
            } else if VM.anklePainExercises[i!].imageName == "ankleEversion" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "ankleEversion", withExtension: "mp4")!
                detailWorkoutTitle = "Ankle Eversion"
                recommendedReps = "10 times on each leg."
                isShowingDetailView = true
            } else if VM.anklePainExercises[i!].imageName == "ankleBalance" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "ankleBalance", withExtension: "mp4")!
                detailWorkoutTitle = "Single Leg Balancing"
                recommendedReps = "3 times with 20 second hold on each leg."
                isShowingDetailView = true
            }
        } else if workout == .shoulderPain {
            //Getting the index of the exercise that was tapped
            let i = VM.shoulderPainExercises.firstIndex { exercise in
                exercise.id == tappedExercise.id
            }
            print(i)
            if VM.shoulderPainExercises[i!].imageName == "kneelingLatStretch" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "kneelingLatStretch", withExtension: "mp4")!
                detailWorkoutTitle = "Kneeling Lat Stretch"
                recommendedReps = "10 times with 3 second hold on each side."
                isShowingDetailView = true
            } else if VM.shoulderPainExercises[i!].imageName == "scapulaPullup" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "scapulaPullup", withExtension: "mp4")!
                detailWorkoutTitle = "Scapular Pullup"
                recommendedReps = "10 times with one second hold at top."
                isShowingDetailView = true
            } else if VM.shoulderPainExercises[i!].imageName == "bandPushup" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "bandPushup", withExtension: "mp4")!
                detailWorkoutTitle = "Banded Pushup"
                recommendedReps = "10 times."
                isShowingDetailView = true
            } else if VM.shoulderPainExercises[i!].imageName == "rotatorCuff" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "rotatorCuff", withExtension: "mp4")!
                detailWorkoutTitle = "External Cable Pull"
                recommendedReps = "10 times on each side."
                isShowingDetailView = true
            } else if VM.shoulderPainExercises[i!].imageName == "bandPullApart" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "bandPullApart", withExtension: "mp4")!
                detailWorkoutTitle = "Band Pull Apart"
                recommendedReps = "10 times."
                isShowingDetailView = true
            } else if VM.shoulderPainExercises[i!].imageName == "dumbbellRaise" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "dumbbellRaise", withExtension: "mp4")!
                detailWorkoutTitle = "Dumbbell Raises"
                recommendedReps = "10 times on each side."
                isShowingDetailView = true
            } else if VM.shoulderPainExercises[i!].imageName == "kettlebellPush" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "kettlebellPush", withExtension: "mp4")!
                detailWorkoutTitle = "Kettlebell Pushes"
                recommendedReps = "10 times on each side."
                isShowingDetailView = true
            } else if VM.shoulderPainExercises[i!].imageName == "worldsGreatestStretch" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "worldsGreatestStretch", withExtension: "mp4")!
                detailWorkoutTitle = "Worlds Greatest Stretch"
                recommendedReps = "10 times on each side."
                isShowingDetailView = true
            } else if VM.shoulderPainExercises[i!].imageName == "backFoamRolling" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "backFoamRolling", withExtension: "mp4")!
                detailWorkoutTitle = "Back Foam Rolling"
                recommendedReps = "10 times."
                isShowingDetailView = true
            } else if VM.shoulderPainExercises[i!].imageName == "supermanRow" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "supermanRow", withExtension: "mp4")!
                detailWorkoutTitle = "Superman Rows"
                recommendedReps = "10 times."
                isShowingDetailView = true
            } else if VM.shoulderPainExercises[i!].imageName == "facepull" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "facepull", withExtension: "mp4")!
                detailWorkoutTitle = "Facepulls"
                recommendedReps = "10 times."
                isShowingDetailView = true
            } else if VM.shoulderPainExercises[i!].imageName == "singleDumbbellRow" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "singleDumbbellRow", withExtension: "mp4")!
                detailWorkoutTitle = "Single Dumbbell Rows"
                recommendedReps = "10 times on each side."
                isShowingDetailView = true
            }
        } else if workout == .kneePain {
            //Getting the index of the exercise that was tapped
            let i = VM.kneePainExercises.firstIndex { exercise in
                exercise.id == tappedExercise.id
            }
            print(i)
            if VM.kneePainExercises[i!].imageName == "bulgarianSplitSquat" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "bulgarianSplitSquat", withExtension: "mp4")!
                detailWorkoutTitle = "Bulgarian Split Squats"
                recommendedReps = "10 times on each side."
                isShowingDetailView = true
            } else if VM.kneePainExercises[i!].imageName == "hipAbductions" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "hipAbductions", withExtension: "mp4")!
                detailWorkoutTitle = "Hip Abductions"
                recommendedReps = "10 times on each side."
                isShowingDetailView = true
            } else if VM.kneePainExercises[i!].imageName == "legBridge" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "legBridge", withExtension: "mp4")!
                detailWorkoutTitle = "Glute Bridges"
                recommendedReps = "10 times on each side."
                isShowingDetailView = true
            } else if VM.kneePainExercises[i!].imageName == "stepup" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "stepup", withExtension: "mp4")!
                detailWorkoutTitle = "Step Ups"
                recommendedReps = "10 times on each leg."
                isShowingDetailView = true
            } else if VM.kneePainExercises[i!].imageName == "worldsGreatestStretch" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "worldsGreatestStretch", withExtension: "mp4")!
                detailWorkoutTitle = "Worlds Greatest Stretch"
                recommendedReps = "10 times on each side."
                isShowingDetailView = true
            } else if VM.kneePainExercises[i!].imageName == "hamstringCurl" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "hamstringCurl", withExtension: "mp4")!
                detailWorkoutTitle = "Hamstring Curl"
                recommendedReps = "10 times."
                isShowingDetailView = true
            } else if VM.kneePainExercises[i!].imageName == "cossackSquat" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "cossackSquat", withExtension: "mp4")!
                detailWorkoutTitle = "Cossack Squats"
                recommendedReps = "10 times on each side."
                isShowingDetailView = true
            } else if VM.kneePainExercises[i!].imageName == "calfRolling" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "calfRolling", withExtension: "mp4")!
                detailWorkoutTitle = "Calf Foam Rolling"
                recommendedReps = "10 times on each calf."
                isShowingDetailView = true
            } else if VM.kneePainExercises[i!].imageName == "wallSit" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "wallSit", withExtension: "mp4")!
                detailWorkoutTitle = "Wall Sits"
                recommendedReps = "1 hold of 45 seconds. If can do more, use one leg."
                isShowingDetailView = true
            } else if VM.kneePainExercises[i!].imageName == "calfRaise" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "calfRaise", withExtension: "mp4")!
                detailWorkoutTitle = "Calf Raises"
                recommendedReps = "15 repetitions."
                isShowingDetailView = true
            }

        }else if workout == .backPain {
            //Getting the index of the exercise that was tapped
            let i = VM.backPainExercises.firstIndex { exercise in
                exercise.id == tappedExercise.id
            }
            print(i)
            if VM.backPainExercises[i!].imageName == "catCow" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "catCow", withExtension: "mp4")!
                detailWorkoutTitle = "Cat and Cows"
                recommendedReps = "15 times."
                isShowingDetailView = true
            } else if VM.backPainExercises[i!].imageName == "cablePullThrough" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "cablePullThrough", withExtension: "mp4")!
                detailWorkoutTitle = "Cable Pull Through"
                recommendedReps = "12 times."
                isShowingDetailView = true
            } else if VM.backPainExercises[i!].imageName == "supineDrawIn" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "supineDrawIn", withExtension: "mp4")!
                detailWorkoutTitle = "Belly Vacuums"
                recommendedReps = "10 times."
                isShowingDetailView = true
            } else if VM.backPainExercises[i!].imageName == "legBridge" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "legBridge", withExtension: "mp4")!
                detailWorkoutTitle = "Glute Bridges"
                recommendedReps = "10 times on each side."
                isShowingDetailView = true
            } else if VM.backPainExercises[i!].imageName == "worldsGreatestStretch" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "worldsGreatestStretch", withExtension: "mp4")!
                detailWorkoutTitle = "Worlds Greatest Stretch"
                recommendedReps = "10 times on each side."
                isShowingDetailView = true
            } else if VM.backPainExercises[i!].imageName == "birdDog" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "birdDog", withExtension: "mp4")!
                detailWorkoutTitle = "Bird Dogs"
                recommendedReps = "10 times on each side."
                isShowingDetailView = true
            } else if VM.backPainExercises[i!].imageName == "hipAbductions" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "hipAbductions", withExtension: "mp4")!
                detailWorkoutTitle = "Hip Abductions"
                recommendedReps = "10 times on each side."
                isShowingDetailView = true
            }

        } else if workout == .fiveMinuteMobility {
            //Getting the index of the exercise that was tapped
            let i = VM.fiveMinuteMobilityExercises.firstIndex { exercise in
                exercise.id == tappedExercise.id
            }
            print(i)
            if VM.fiveMinuteMobilityExercises[i!].imageName == "catCow" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "catCow", withExtension: "mp4")!
                detailWorkoutTitle = "Cat and Cows"
                recommendedReps = "15 times."
                isShowingDetailView = true
            } else if VM.fiveMinuteMobilityExercises[i!].imageName == "cossackSquat" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "cossackSquat", withExtension: "mp4")!
                detailWorkoutTitle = "Cossack Squats"
                recommendedReps = "10 times on each."
                isShowingDetailView = true
            } else if VM.fiveMinuteMobilityExercises[i!].imageName == "pikeToCobra" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "pikeToCobra", withExtension: "mp4")!
                detailWorkoutTitle = "Pike To Cobra Position"
                recommendedReps = "10 times."
                isShowingDetailView = true
            } else if VM.fiveMinuteMobilityExercises[i!].imageName == "standingLatStretch" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "standingLatStretch", withExtension: "mp4")!
                detailWorkoutTitle = "Standing Lat Stretch"
                recommendedReps = "10 times on each side."
                isShowingDetailView = true
            } else if VM.fiveMinuteMobilityExercises[i!].imageName == "worldsGreatestStretch" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "worldsGreatestStretch", withExtension: "mp4")!
                detailWorkoutTitle = "Worlds Greatest Stretch"
                recommendedReps = "10 times on each side."
                isShowingDetailView = true
            }
        } else if workout == .tenMinuteMobility {
            //Getting the index of the exercise that was tapped
            let i = VM.tenMinuteMobilityExercises.firstIndex { exercise in
                exercise.id == tappedExercise.id
            }
            print(i)
            if VM.tenMinuteMobilityExercises[i!].imageName == "headRotations" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "headRotations", withExtension: "mp4")!
                detailWorkoutTitle = "Head Rotations"
                recommendedReps = "5 full rotations in each direction."
                isShowingDetailView = true
            } else if VM.tenMinuteMobilityExercises[i!].imageName == "pikeToCobra" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "pikeToCobra", withExtension: "mp4")!
                detailWorkoutTitle = "Pike To Cobra Position"
                recommendedReps = "10 times."
                isShowingDetailView = true
            } else if VM.tenMinuteMobilityExercises[i!].imageName == "catCow" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "catCow", withExtension: "mp4")!
                detailWorkoutTitle = "Cat and Cows"
                recommendedReps = "15 times."
                isShowingDetailView = true
            } else if VM.tenMinuteMobilityExercises[i!].imageName == "thoracicBridge" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "thoracicBridge", withExtension: "mp4")!
                detailWorkoutTitle = "Thorcic Bridges"
                recommendedReps = "5 times on each side."
                isShowingDetailView = true
            } else if VM.tenMinuteMobilityExercises[i!].imageName == "kneelingHipFlexorStretch" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "kneelingHipFlexorStretch", withExtension: "mp4")!
                detailWorkoutTitle = "Kneeling Hip Stretch"
                recommendedReps = "Three 5-second holds on each side."
                isShowingDetailView = true
            } else if VM.tenMinuteMobilityExercises[i!].imageName == "supermanRow" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "supermanRow", withExtension: "mp4")!
                detailWorkoutTitle = "Superman Rows"
                recommendedReps = "10 times."
                isShowingDetailView = true
            } else if VM.tenMinuteMobilityExercises[i!].imageName == "bandedShoulderStretch" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "bandedShoulderStretch", withExtension: "mp4")!
                detailWorkoutTitle = "Banded Shoulder Stretch"
                recommendedReps = "10 times."
                isShowingDetailView = true
            } else if VM.tenMinuteMobilityExercises[i!].imageName == "hingeToSquat" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "hingeToSquat", withExtension: "mp4")!
                detailWorkoutTitle = "Hinge To Squats"
                recommendedReps = "10 times."
                isShowingDetailView = true
            } else if VM.tenMinuteMobilityExercises[i!].imageName == "legBridge" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "legBridge", withExtension: "mp4")!
                detailWorkoutTitle = "Leg bridges"
                recommendedReps = "10 times on each side."
                isShowingDetailView = true
            } else if VM.tenMinuteMobilityExercises[i!].imageName == "burpee" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "burpee", withExtension: "mp4")!
                detailWorkoutTitle = "Burpees"
                recommendedReps = "5 times."
                isShowingDetailView = true
            }
        } else if workout == .fifteenMinuteMobility {
            //Getting the index of the exercise that was tapped
            let i = VM.fifteenMinuteMobilityExercises.firstIndex { exercise in
                exercise.id == tappedExercise.id
            }
            print(i)
            if VM.fifteenMinuteMobilityExercises[i!].imageName == "headRotations" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "headRotations", withExtension: "mp4")!
                detailWorkoutTitle = "Head Rotations"
                recommendedReps = "5 full rotations in each direction."
                isShowingDetailView = true
            } else if VM.fifteenMinuteMobilityExercises[i!].imageName == "catCow" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "catCow", withExtension: "mp4")!
                detailWorkoutTitle = "Cat and Cows"
                recommendedReps = "15 times."
                isShowingDetailView = true
            } else if VM.fifteenMinuteMobilityExercises[i!].imageName == "standingLatStretch" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "standingLatStretch", withExtension: "mp4")!
                detailWorkoutTitle = "Standing Lat Stretch"
                recommendedReps = "10 times on each side."
                isShowingDetailView = true
            } else if VM.fifteenMinuteMobilityExercises[i!].imageName == "childsPose" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "childsPose", withExtension: "mp4")!
                detailWorkoutTitle = "Childs Pose"
                recommendedReps = "3 times with 20 second hold at bottom."
                isShowingDetailView = true
            } else if VM.fifteenMinuteMobilityExercises[i!].imageName == "birdDog" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "birdDog", withExtension: "mp4")!
                detailWorkoutTitle = "Bird Dogs"
                recommendedReps = "10 times on each side."
                isShowingDetailView = true
            } else if VM.fifteenMinuteMobilityExercises[i!].imageName == "kneelingHipFlexorStretch" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "kneelingHipFlexorStretch", withExtension: "mp4")!
                detailWorkoutTitle = "Kneeling Hip Stretch"
                recommendedReps = "Three 5-second holds on each side."
                isShowingDetailView = true
            } else if VM.fifteenMinuteMobilityExercises[i!].imageName == "worldsGreatestStretch" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "worldsGreatestStretch", withExtension: "mp4")!
                detailWorkoutTitle = "Worlds Greatest Stretch"
                recommendedReps = "10 times on each side."
                isShowingDetailView = true
            } else if VM.fifteenMinuteMobilityExercises[i!].imageName == "toeTouch" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "toeTouch", withExtension: "mp4")!
                detailWorkoutTitle = "Toe touches"
                recommendedReps = "10 times."
                isShowingDetailView = true
            } else if VM.fifteenMinuteMobilityExercises[i!].imageName == "pikeToCobra" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "pikeToCobra", withExtension: "mp4")!
                detailWorkoutTitle = "Pike To Cobra Position"
                recommendedReps = "10 times."
                isShowingDetailView = true
            } else if VM.fifteenMinuteMobilityExercises[i!].imageName == "hingeToSquat" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "hingeToSquat", withExtension: "mp4")!
                detailWorkoutTitle = "Hinge To Squats"
                recommendedReps = "10 times."
                isShowingDetailView = true
            } else if VM.fifteenMinuteMobilityExercises[i!].imageName == "supermanRow" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "supermanRow", withExtension: "mp4")!
                detailWorkoutTitle = "Superman Rows"
                recommendedReps = "10 times."
                isShowingDetailView = true
            } else if VM.fifteenMinuteMobilityExercises[i!].imageName == "legBridge" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "legBridge", withExtension: "mp4")!
                detailWorkoutTitle = "Leg bridges"
                recommendedReps = "10 times on each side."
                isShowingDetailView = true
            } else if VM.fifteenMinuteMobilityExercises[i!].imageName == "bandedShoulderStretch" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "bandedShoulderStretch", withExtension: "mp4")!
                detailWorkoutTitle = "Banded Shoulder Stretch"
                recommendedReps = "10 times."
                isShowingDetailView = true
            } else if VM.fifteenMinuteMobilityExercises[i!].imageName == "calfStretch" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "calfStretch", withExtension: "mp4")!
                detailWorkoutTitle = "Calf Stretches"
                recommendedReps = "Five 5-second holds on each side."
                isShowingDetailView = true
            } else if VM.fifteenMinuteMobilityExercises[i!].imageName == "burpee" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "burpee", withExtension: "mp4")!
                detailWorkoutTitle = "Burpees"
                recommendedReps = "5 times."
                isShowingDetailView = true
            }
        } else if workout == .upperBodyMobility {
            //Getting the index of the exercise that was tapped
            let i = VM.upperbodyMobilityExercises.firstIndex { exercise in
                exercise.id == tappedExercise.id
            }
            print(i)
            if VM.upperbodyMobilityExercises[i!].imageName == "worldsGreatestStretch" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "worldsGreatestStretch", withExtension: "mp4")!
                detailWorkoutTitle = "Worlds Greatest Stretch"
                recommendedReps = "10 times in each direction."
                isShowingDetailView = true
            } else if VM.upperbodyMobilityExercises[i!].imageName == "bandedShoulderStretch" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "bandedShoulderStretch", withExtension: "mp4")!
                detailWorkoutTitle = "Banded Shoulder Stretch"
                recommendedReps = "10 times."
                isShowingDetailView = true
            } else if VM.upperbodyMobilityExercises[i!].imageName == "backFoamRolling" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "backFoamRolling", withExtension: "mp4")!
                detailWorkoutTitle = "Back Foam Rolling"
                recommendedReps = "10 times."
                isShowingDetailView = true
            } else if VM.upperbodyMobilityExercises[i!].imageName == "kneelingLatStretch" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "kneelingLatStretch", withExtension: "mp4")!
                detailWorkoutTitle = "Kneeling Lat Stretch"
                recommendedReps = "6 times on both sides."
                isShowingDetailView = true
            } else if VM.upperbodyMobilityExercises[i!].imageName == "supermanRow" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "supermanRow", withExtension: "mp4")!
                detailWorkoutTitle = "Superman Rows"
                recommendedReps = "10 times."
                isShowingDetailView = true
            } else if VM.upperbodyMobilityExercises[i!].imageName == "wristCircles" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "wristCircles", withExtension: "mp4")!
                detailWorkoutTitle = "Wrist Circles"
                recommendedReps = "10 circles in both directions."
                isShowingDetailView = true
            } else if VM.upperbodyMobilityExercises[i!].imageName == "rotatorCuff" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "rotatorCuff", withExtension: "mp4")!
                detailWorkoutTitle = "RotatorCuff Strengthening"
                recommendedReps = "10 pulls on each side."
                isShowingDetailView = true
            }
        } else if workout == .shouldersMobility {
            //Getting the index of the exercise that was tapped
            let i = VM.shoulderMobilityExercises.firstIndex { exercise in
                exercise.id == tappedExercise.id
            }
            print(i)
            if VM.shoulderMobilityExercises[i!].imageName == "bandedShoulderStretch" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "bandedShoulderStretch", withExtension: "mp4")!
                detailWorkoutTitle = "Banded Shoulder Stretch"
                recommendedReps = "10 times."
                isShowingDetailView = true
            } else if VM.shoulderMobilityExercises[i!].imageName == "backFoamRolling" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "backFoamRolling", withExtension: "mp4")!
                detailWorkoutTitle = "Back Foam Rolling"
                recommendedReps = "10 times."
                isShowingDetailView = true
            } else if VM.shoulderMobilityExercises[i!].imageName == "kneelingLatStretch" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "kneelingLatStretch", withExtension: "mp4")!
                detailWorkoutTitle = "Kneeling Lat Stretch"
                recommendedReps = "6 times on both sides."
                isShowingDetailView = true
            } else if VM.shoulderMobilityExercises[i!].imageName == "supermanRow" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "supermanRow", withExtension: "mp4")!
                detailWorkoutTitle = "Superman Rows"
                recommendedReps = "10 times."
                isShowingDetailView = true
            } else if VM.shoulderMobilityExercises[i!].imageName == "wristCircles" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "wristCircles", withExtension: "mp4")!
                detailWorkoutTitle = "Wrist Circles"
                recommendedReps = "10 rotations in both directions."
                isShowingDetailView = true
            } else if VM.shoulderMobilityExercises[i!].imageName == "bandPullApart" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "bandPullApart", withExtension: "mp4")!
                detailWorkoutTitle = "Band Pull Aparts"
                recommendedReps = "10 times."
                isShowingDetailView = true
            } else if VM.shoulderMobilityExercises[i!].imageName == "scapulaPullup" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "scapulaPullup", withExtension: "mp4")!
                detailWorkoutTitle = "Scapular Pullups"
                recommendedReps = "10 times with 1 second hold when contracted."
                isShowingDetailView = true
            }
            
        } else if workout == .legsDayMobility {
            //Getting the index of the exercise that was tapped
            let i = VM.legDayMobilityExercises.firstIndex { exercise in
                exercise.id == tappedExercise.id
            }
            print(i)
            if VM.legDayMobilityExercises[i!].imageName == "supineDrawIn" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "supineDrawIn", withExtension: "mp4")!
                detailWorkoutTitle = "Belly Vacuum"
                recommendedReps = "10 times."
                isShowingDetailView = true
            } else if VM.legDayMobilityExercises[i!].imageName == "catCow" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "catCow", withExtension: "mp4")!
                detailWorkoutTitle = "Cat and Cows"
                recommendedReps = "10 times."
                isShowingDetailView = true
            } else if VM.legDayMobilityExercises[i!].imageName == "worldsGreatestStretch" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "worldsGreatestStretch", withExtension: "mp4")!
                detailWorkoutTitle = "Worlds Greatest Stretch"
                recommendedReps = "10 times on both sides."
                isShowingDetailView = true
            } else if VM.legDayMobilityExercises[i!].imageName == "birdDog" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "birdDog", withExtension: "mp4")!
                detailWorkoutTitle = "Bird Dogs"
                recommendedReps = "10 times on both sides."
                isShowingDetailView = true
            } else if VM.legDayMobilityExercises[i!].imageName == "hingeToSquat" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "hingeToSquat", withExtension: "mp4")!
                detailWorkoutTitle = "Hinge To Squats"
                recommendedReps = "10 times."
                isShowingDetailView = true
            } else if VM.legDayMobilityExercises[i!].imageName == "legBridge" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "legBridge", withExtension: "mp4")!
                detailWorkoutTitle = "Glute Bridges"
                recommendedReps = "10 times on both sides."
                isShowingDetailView = true
            } else if VM.legDayMobilityExercises[i!].imageName == "calfRolling" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "calfRolling", withExtension: "mp4")!
                detailWorkoutTitle = "Calf Foam Rolling"
                recommendedReps = "10 times on both legs."
                isShowingDetailView = true
            }
            
        } else if workout == .deadliftingMobility {
            //Getting the index of the exercise that was tapped
            let i = VM.deadliftingMobilityExercises.firstIndex { exercise in
                exercise.id == tappedExercise.id
            }
            print(i)
            if VM.deadliftingMobilityExercises[i!].imageName == "supineDrawIn" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "supineDrawIn", withExtension: "mp4")!
                detailWorkoutTitle = "Belly Vacuum"
                recommendedReps = "10 times."
                isShowingDetailView = true
            } else if VM.deadliftingMobilityExercises[i!].imageName == "catCow" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "catCow", withExtension: "mp4")!
                detailWorkoutTitle = "Cat and Cows"
                recommendedReps = "10 times."
                isShowingDetailView = true
            } else if VM.deadliftingMobilityExercises[i!].imageName == "worldsGreatestStretch" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "worldsGreatestStretch", withExtension: "mp4")!
                detailWorkoutTitle = "Worlds Greatest Stretch"
                recommendedReps = "10 times on both sides."
                isShowingDetailView = true
            } else if VM.deadliftingMobilityExercises[i!].imageName == "birdDog" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "birdDog", withExtension: "mp4")!
                detailWorkoutTitle = "Bird Dogs"
                recommendedReps = "10 times on both sides."
                isShowingDetailView = true
            } else if VM.deadliftingMobilityExercises[i!].imageName == "hipAbductions" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "hipAbductions", withExtension: "mp4")!
                detailWorkoutTitle = "Hip abductions"
                recommendedReps = "10 times on both sides."
                isShowingDetailView = true
            } else if VM.deadliftingMobilityExercises[i!].imageName == "legBridge" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "legBridge", withExtension: "mp4")!
                detailWorkoutTitle = "Glute Bridges"
                recommendedReps = "10 times on both sides."
                isShowingDetailView = true
            } else if VM.deadliftingMobilityExercises[i!].imageName == "singleLegDeadlift" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "singleLegDeadlift", withExtension: "mp4")!
                detailWorkoutTitle = "Single Leg Deadlift"
                recommendedReps = "10 times on both legs."
                isShowingDetailView = true
            }
            
        } else if workout == .neckPosture {
            //Getting the index of the exercise that was tapped
            let i = VM.neckPostureExercises.firstIndex { exercise in
                exercise.id == tappedExercise.id
            }
            print(i)
            if VM.neckPostureExercises[i!].imageName == "chinTucks" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "chinTucks", withExtension: "mp4")!
                detailWorkoutTitle = "Chin Tucks"
                recommendedReps = "10 times with 1 second hold at back position."
                isShowingDetailView = true
            } else if VM.neckPostureExercises[i!].imageName == "facepull" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "facepull", withExtension: "mp4")!
                detailWorkoutTitle = "Facepulls"
                recommendedReps = "10 times."
                isShowingDetailView = true
            } else if VM.neckPostureExercises[i!].imageName == "bandPullApart" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "bandPullApart", withExtension: "mp4")!
                detailWorkoutTitle = "Band Pull Aparts"
                recommendedReps = "10 times."
                isShowingDetailView = true
            }
            
        } else if workout == .backPosture {
            //Getting the index of the exercise that was tapped
            let i = VM.backPostureExercises.firstIndex { exercise in
                exercise.id == tappedExercise.id
            }
            print(i)
            if VM.backPostureExercises[i!].imageName == "legBridge" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "legBridge", withExtension: "mp4")!
                detailWorkoutTitle = "Glute Bridges"
                recommendedReps = "10 times on both legs."
                isShowingDetailView = true
            } else if VM.backPostureExercises[i!].imageName == "kneelingHipFlexorStretch" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "kneelingHipFlexorStretch", withExtension: "mp4")!
                detailWorkoutTitle = "Kneeling Hip Stretch"
                recommendedReps = "10 times on both legs."
                isShowingDetailView = true
            } else if VM.backPostureExercises[i!].imageName == "legRaises" {
                print("Found exercise!")
                videoUrl = Bundle.main.url(forResource: "legRaises", withExtension: "mp4")!
                detailWorkoutTitle = "Leg Raises"
                recommendedReps = "10 times."
                isShowingDetailView = true
            }
            
        }
    }
    func completeExercise(tappedExercise: WorkoutViewModel.Exercise) {
        if workout == .elbowPain {
            //Getting the index of the exercise that was tapped
            let i = VM.elbowPainExercises.firstIndex { exercise in
                exercise.id == tappedExercise.id
            }
            VM.elbowPainExercises[i!].isDone.toggle()
            workoutProgress = VM.checkIfWorkoutComplete(exercises: VM.elbowPainExercises)
            if workoutProgress == 1 {
                showCompletePopup = true
            }
        } else if workout == .wristPain {
            //Getting the index of the exercise that was tapped
            let i = VM.wristPainExercises.firstIndex { exercise in
                exercise.id == tappedExercise.id
            }
            VM.wristPainExercises[i!].isDone.toggle()
            workoutProgress = VM.checkIfWorkoutComplete(exercises: VM.wristPainExercises)
            if workoutProgress == 1 {
                showCompletePopup = true
            }
        } else if workout == .neckPain {
            //Getting the index of the exercise that was tapped
            let i = VM.neckPainExercises.firstIndex { exercise in
                exercise.id == tappedExercise.id
            }
            VM.neckPainExercises[i!].isDone.toggle()
            workoutProgress = VM.checkIfWorkoutComplete(exercises: VM.neckPainExercises)
            if workoutProgress == 1 {
                showCompletePopup = true
            }
        } else if workout == .anklePain {
            //Getting the index of the exercise that was tapped
            let i = VM.anklePainExercises.firstIndex { exercise in
                exercise.id == tappedExercise.id
            }
            VM.anklePainExercises[i!].isDone.toggle()
            workoutProgress = VM.checkIfWorkoutComplete(exercises: VM.anklePainExercises)
            if workoutProgress == 1 {
                showCompletePopup = true
            }
        } else if workout == .shoulderPain {
            //Getting the index of the exercise that was tapped
            let i = VM.shoulderPainExercises.firstIndex { exercise in
                exercise.id == tappedExercise.id
            }
            VM.shoulderPainExercises[i!].isDone.toggle()
            workoutProgress = VM.checkIfWorkoutComplete(exercises: VM.shoulderPainExercises)
            if workoutProgress == 1 {
                showCompletePopup = true
            }
        } else if workout == .kneePain {
            //Getting the index of the exercise that was tapped
            let i = VM.kneePainExercises.firstIndex { exercise in
                exercise.id == tappedExercise.id
            }
            VM.kneePainExercises[i!].isDone.toggle()
            workoutProgress = VM.checkIfWorkoutComplete(exercises: VM.kneePainExercises)
            if workoutProgress == 1 {
                showCompletePopup = true
            }
        } else if workout == .backPain {
            //Getting the index of the exercise that was tapped
            let i = VM.backPainExercises.firstIndex { exercise in
                exercise.id == tappedExercise.id
            }
            VM.backPainExercises[i!].isDone.toggle()
            workoutProgress = VM.checkIfWorkoutComplete(exercises: VM.backPainExercises)
            if workoutProgress == 1 {
                showCompletePopup = true
            }
        } else if workout == .fiveMinuteMobility {
                //Getting the index of the exercise that was tapped
                let i = VM.fiveMinuteMobilityExercises.firstIndex { exercise in
                    exercise.id == tappedExercise.id
                }
                VM.fiveMinuteMobilityExercises[i!].isDone.toggle()
                workoutProgress = VM.checkIfWorkoutComplete(exercises: VM.fiveMinuteMobilityExercises)
                if workoutProgress == 1 {
                    showCompletePopup = true
                }
            } else if workout == .tenMinuteMobility {
                //Getting the index of the exercise that was tapped
                let i = VM.tenMinuteMobilityExercises.firstIndex { exercise in
                    exercise.id == tappedExercise.id
                }
                VM.tenMinuteMobilityExercises[i!].isDone.toggle()
                workoutProgress = VM.checkIfWorkoutComplete(exercises: VM.tenMinuteMobilityExercises)
                if workoutProgress == 1 {
                    showCompletePopup = true
                }
            } else if workout == .fifteenMinuteMobility {
                //Getting the index of the exercise that was tapped
                let i = VM.fifteenMinuteMobilityExercises.firstIndex { exercise in
                    exercise.id == tappedExercise.id
                }
                VM.fifteenMinuteMobilityExercises[i!].isDone.toggle()
                workoutProgress = VM.checkIfWorkoutComplete(exercises: VM.fifteenMinuteMobilityExercises)
                if workoutProgress == 1 {
                    showCompletePopup = true
                }
            } else if workout == .upperBodyMobility {
                //Getting the index of the exercise that was tapped
                let i = VM.upperbodyMobilityExercises.firstIndex { exercise in
                    exercise.id == tappedExercise.id
                }
                VM.upperbodyMobilityExercises[i!].isDone.toggle()
                workoutProgress = VM.checkIfWorkoutComplete(exercises: VM.upperbodyMobilityExercises)
                if workoutProgress == 1 {
                    showCompletePopup = true
                }
            } else if workout == .legsDayMobility {
                //Getting the index of the exercise that was tapped
                let i = VM.legDayMobilityExercises.firstIndex { exercise in
                    exercise.id == tappedExercise.id
                }
                VM.legDayMobilityExercises[i!].isDone.toggle()
                workoutProgress = VM.checkIfWorkoutComplete(exercises: VM.legDayMobilityExercises)
                if workoutProgress == 1 {
                    showCompletePopup = true
                }
            } else if workout == .deadliftingMobility {
                //Getting the index of the exercise that was tapped
                let i = VM.deadliftingMobilityExercises.firstIndex { exercise in
                    exercise.id == tappedExercise.id
                }
                VM.deadliftingMobilityExercises[i!].isDone.toggle()
                workoutProgress = VM.checkIfWorkoutComplete(exercises: VM.deadliftingMobilityExercises)
                if workoutProgress == 1 {
                    showCompletePopup = true
                }
            } else if workout == .shouldersMobility {
                //Getting the index of the exercise that was tapped
                let i = VM.shoulderMobilityExercises.firstIndex { exercise in
                    exercise.id == tappedExercise.id
                }
                VM.shoulderMobilityExercises[i!].isDone.toggle()
                workoutProgress = VM.checkIfWorkoutComplete(exercises: VM.shoulderMobilityExercises)
                if workoutProgress == 1 {
                    showCompletePopup = true
                }
            } else if workout == .neckPosture {
                //Getting the index of the exercise that was tapped
                let i = VM.neckPostureExercises.firstIndex { exercise in
                    exercise.id == tappedExercise.id
                }
                VM.neckPostureExercises[i!].isDone.toggle()
                workoutProgress = VM.checkIfWorkoutComplete(exercises: VM.neckPostureExercises)
                if workoutProgress == 1 {
                    showCompletePopup = true
                }
            } else if workout == .backPosture {
                //Getting the index of the exercise that was tapped
                let i = VM.backPostureExercises.firstIndex { exercise in
                    exercise.id == tappedExercise.id
                }
                VM.backPostureExercises[i!].isDone.toggle()
                workoutProgress = VM.checkIfWorkoutComplete(exercises: VM.backPostureExercises)
                if workoutProgress == 1 {
                    showCompletePopup = true
                }
            }
            
        }
        var body: some View {
            VStack {
                CircularProgressView(progress: $workoutProgress)
                    .frame(width: 125, height: 125)
                    .padding(30)
                    .animation(.easeInOut)
                Text("Exercises")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom)
                ScrollView {
                    //TODO: progress here
                    
                    
                    
                    
                    VStack {
                        if workout == .elbowPain {
                            ForEach(VM.elbowPainExercises) { tappableExercise in
                                
                                NavigationLink(isActive: $isShowingDetailView) {
                                    WorkoutDetailView(exercise: .init(videoUrl: videoUrl, workoutTitle: detailWorkoutTitle, recommendedReps: recommendedReps))
                                } label: {
                                    ExerciseView(exercise: tappableExercise)
                                        .padding(7)
                                        .animation(.default)
                                    
                                        .onTapGesture {
                                            showDetailView(tappedExercise: tappableExercise)
                                        }
                                        .gesture(DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
                                            .onEnded { value in
                                                print(value.translation)
                                                switch(value.translation.width, value.translation.height) {
                                                case (...0, -30...30):
                                                    print("left")
                                                    completeExercise(tappedExercise: tappableExercise)
                                                case (0..., -30...30):
                                                    print("right")
                                                    completeExercise(tappedExercise: tappableExercise)
                                                case (-100...100, ...0):  print("up swipe")
                                                case (-100...100, 0...):  print("down swipe")
                                                default:  print("no clue")
                                                }
                                            }
                                        )
                                }
                            }
                        } else if workout == .wristPain {
                            ForEach(VM.wristPainExercises) { tappableExercise in
                                
                                NavigationLink(isActive: $isShowingDetailView) {
                                    WorkoutDetailView(exercise: .init(videoUrl: videoUrl, workoutTitle: detailWorkoutTitle, recommendedReps: recommendedReps))
                                } label: {
                                    ExerciseView(exercise: tappableExercise)
                                        .padding(7)
                                        .animation(.default)
                                    
                                        .onTapGesture {
                                            showDetailView(tappedExercise: tappableExercise)
                                        }
                                        .gesture(DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
                                            .onEnded { value in
                                                print(value.translation)
                                                switch(value.translation.width, value.translation.height) {
                                                case (...0, -30...30):
                                                    print("left")
                                                    completeExercise(tappedExercise: tappableExercise)
                                                case (0..., -30...30):
                                                    print("right")
                                                    completeExercise(tappedExercise: tappableExercise)
                                                case (-100...100, ...0):  print("up swipe")
                                                case (-100...100, 0...):  print("down swipe")
                                                default:  print("no clue")
                                                }
                                            }
                                        )
                                }
                            }
                        } else if workout == .neckPain {
                            ForEach(VM.neckPainExercises) { tappableExercise in
                                
                                NavigationLink(isActive: $isShowingDetailView) {
                                    WorkoutDetailView(exercise: .init(videoUrl: videoUrl, workoutTitle: detailWorkoutTitle, recommendedReps: recommendedReps))
                                } label: {
                                    ExerciseView(exercise: tappableExercise)
                                        .padding(7)
                                        .animation(.default)
                                    
                                        .onTapGesture {
                                            showDetailView(tappedExercise: tappableExercise)
                                        }
                                        .gesture(DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
                                            .onEnded { value in
                                                print(value.translation)
                                                switch(value.translation.width, value.translation.height) {
                                                case (...0, -30...30):
                                                    print("left")
                                                    completeExercise(tappedExercise: tappableExercise)
                                                case (0..., -30...30):
                                                    print("right")
                                                    completeExercise(tappedExercise: tappableExercise)
                                                case (-100...100, ...0):  print("up swipe")
                                                case (-100...100, 0...):  print("down swipe")
                                                default:  print("no clue")
                                                }
                                            }
                                        )
                                }
                            }
                        } else if workout == .anklePain {
                            ForEach(VM.anklePainExercises) { tappableExercise in
                                
                                NavigationLink(isActive: $isShowingDetailView) {
                                    WorkoutDetailView(exercise: .init(videoUrl: videoUrl, workoutTitle: detailWorkoutTitle, recommendedReps: recommendedReps))
                                } label: {
                                    ExerciseView(exercise: tappableExercise)
                                        .padding(7)
                                        .animation(.default)
                                    
                                        .onTapGesture {
                                            showDetailView(tappedExercise: tappableExercise)
                                        }
                                        .gesture(DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
                                            .onEnded { value in
                                                print(value.translation)
                                                switch(value.translation.width, value.translation.height) {
                                                case (...0, -30...30):
                                                    print("left")
                                                    completeExercise(tappedExercise: tappableExercise)
                                                case (0..., -30...30):
                                                    print("right")
                                                    completeExercise(tappedExercise: tappableExercise)
                                                case (-100...100, ...0):  print("up swipe")
                                                case (-100...100, 0...):  print("down swipe")
                                                default:  print("no clue")
                                                }
                                            }
                                        )
                                }
                            }
                        } else if workout == .shoulderPain {
                            ForEach(VM.shoulderPainExercises) { tappableExercise in
                                
                                NavigationLink(isActive: $isShowingDetailView) {
                                    WorkoutDetailView(exercise: .init(videoUrl: videoUrl, workoutTitle: detailWorkoutTitle, recommendedReps: recommendedReps))
                                } label: {
                                    ExerciseView(exercise: tappableExercise)
                                        .padding(7)
                                        .animation(.default)
                                    
                                        .onTapGesture {
                                            showDetailView(tappedExercise: tappableExercise)
                                        }
                                        .gesture(DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
                                            .onEnded { value in
                                                print(value.translation)
                                                switch(value.translation.width, value.translation.height) {
                                                case (...0, -30...30):
                                                    print("left")
                                                    completeExercise(tappedExercise: tappableExercise)
                                                case (0..., -30...30):
                                                    print("right")
                                                    completeExercise(tappedExercise: tappableExercise)
                                                case (-100...100, ...0):  print("up swipe")
                                                case (-100...100, 0...):  print("down swipe")
                                                default:  print("no clue")
                                                }
                                            }
                                        )
                                    
                                }
                                
                                
                            }
                        } else if workout == .kneePain {
                            ForEach(VM.kneePainExercises) { tappableExercise in
                                
                                NavigationLink(isActive: $isShowingDetailView) {
                                    WorkoutDetailView(exercise: .init(videoUrl: videoUrl, workoutTitle: detailWorkoutTitle, recommendedReps: recommendedReps))
                                } label: {
                                    ExerciseView(exercise: tappableExercise)
                                        .padding(7)
                                        .animation(.default)
                                    
                                        .onTapGesture {
                                            showDetailView(tappedExercise: tappableExercise)
                                        }
                                        .gesture(DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
                                            .onEnded { value in
                                                print(value.translation)
                                                switch(value.translation.width, value.translation.height) {
                                                case (...0, -30...30):
                                                    print("left")
                                                    completeExercise(tappedExercise: tappableExercise)
                                                case (0..., -30...30):
                                                    print("right")
                                                    completeExercise(tappedExercise: tappableExercise)
                                                case (-100...100, ...0):  print("up swipe")
                                                case (-100...100, 0...):  print("down swipe")
                                                default:  print("no clue")
                                                }
                                            }
                                        )
                                    
                                }
                                
                                
                            }
                        } else if workout == .backPain {
                            ForEach(VM.backPainExercises) { tappableExercise in
                                
                                NavigationLink(isActive: $isShowingDetailView) {
                                    WorkoutDetailView(exercise: .init(videoUrl: videoUrl, workoutTitle: detailWorkoutTitle, recommendedReps: recommendedReps))
                                } label: {
                                    ExerciseView(exercise: tappableExercise)
                                        .padding(7)
                                        .animation(.default)
                                    
                                        .onTapGesture {
                                            showDetailView(tappedExercise: tappableExercise)
                                        }
                                        .gesture(DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
                                            .onEnded { value in
                                                print(value.translation)
                                                switch(value.translation.width, value.translation.height) {
                                                case (...0, -30...30):
                                                    print("left")
                                                    completeExercise(tappedExercise: tappableExercise)
                                                case (0..., -30...30):
                                                    print("right")
                                                    completeExercise(tappedExercise: tappableExercise)
                                                case (-100...100, ...0):  print("up swipe")
                                                case (-100...100, 0...):  print("down swipe")
                                                default:  print("no clue")
                                                }
                                            }
                                        )
                                    
                                }
                                
                                
                            }
                        }else if workout == .fiveMinuteMobility {
                            ForEach(VM.fiveMinuteMobilityExercises) { tappableExercise in
                                
                                NavigationLink(isActive: $isShowingDetailView) {
                                    WorkoutDetailView(exercise: .init(videoUrl: videoUrl, workoutTitle: detailWorkoutTitle, recommendedReps: recommendedReps))
                                } label: {
                                    ExerciseView(exercise: tappableExercise)
                                        .padding(7)
                                        .animation(.default)
                                    
                                        .onTapGesture {
                                            showDetailView(tappedExercise: tappableExercise)
                                        }
                                        .gesture(DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
                                            .onEnded { value in
                                                print(value.translation)
                                                switch(value.translation.width, value.translation.height) {
                                                case (...0, -30...30):
                                                    print("left")
                                                    completeExercise(tappedExercise: tappableExercise)
                                                case (0..., -30...30):
                                                    print("right")
                                                    completeExercise(tappedExercise: tappableExercise)
                                                case (-100...100, ...0):  print("up swipe")
                                                case (-100...100, 0...):  print("down swipe")
                                                default:  print("no clue")
                                                }
                                            }
                                        )
                                    
                                }
                                
                                
                            }
                        } else if workout == .tenMinuteMobility {
                            ForEach(VM.tenMinuteMobilityExercises) { tappableExercise in
                                
                                NavigationLink(isActive: $isShowingDetailView) {
                                    WorkoutDetailView(exercise: .init(videoUrl: videoUrl, workoutTitle: detailWorkoutTitle, recommendedReps: recommendedReps))
                                } label: {
                                    ExerciseView(exercise: tappableExercise)
                                        .padding(7)
                                        .animation(.default)
                                    
                                        .onTapGesture {
                                            showDetailView(tappedExercise: tappableExercise)
                                        }
                                        .gesture(DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
                                            .onEnded { value in
                                                print(value.translation)
                                                switch(value.translation.width, value.translation.height) {
                                                case (...0, -30...30):
                                                    print("left")
                                                    completeExercise(tappedExercise: tappableExercise)
                                                case (0..., -30...30):
                                                    print("right")
                                                    completeExercise(tappedExercise: tappableExercise)
                                                case (-100...100, ...0):  print("up swipe")
                                                case (-100...100, 0...):  print("down swipe")
                                                default:  print("no clue")
                                                }
                                            }
                                        )
                                    
                                }
                                
                                
                            }
                        } else if workout == .fifteenMinuteMobility {
                            ForEach(VM.fifteenMinuteMobilityExercises) { tappableExercise in
                                
                                NavigationLink(isActive: $isShowingDetailView) {
                                    WorkoutDetailView(exercise: .init(videoUrl: videoUrl, workoutTitle: detailWorkoutTitle, recommendedReps: recommendedReps))
                                } label: {
                                    ExerciseView(exercise: tappableExercise)
                                        .padding(7)
                                        .animation(.default)
                                    
                                        .onTapGesture {
                                            showDetailView(tappedExercise: tappableExercise)
                                        }
                                        .gesture(DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
                                            .onEnded { value in
                                                print(value.translation)
                                                switch(value.translation.width, value.translation.height) {
                                                case (...0, -30...30):
                                                    print("left")
                                                    completeExercise(tappedExercise: tappableExercise)
                                                case (0..., -30...30):
                                                    print("right")
                                                    completeExercise(tappedExercise: tappableExercise)
                                                case (-100...100, ...0):  print("up swipe")
                                                case (-100...100, 0...):  print("down swipe")
                                                default:  print("no clue")
                                                }
                                            }
                                        )
                                    
                                }
                                
                                
                            }
                        } else if workout == .upperBodyMobility {
                            ForEach(VM.upperbodyMobilityExercises) { tappableExercise in
                                
                                NavigationLink(isActive: $isShowingDetailView) {
                                    WorkoutDetailView(exercise: .init(videoUrl: videoUrl, workoutTitle: detailWorkoutTitle, recommendedReps: recommendedReps))
                                } label: {
                                    ExerciseView(exercise: tappableExercise)
                                        .padding(7)
                                        .animation(.default)
                                    
                                        .onTapGesture {
                                            showDetailView(tappedExercise: tappableExercise)
                                        }
                                        .gesture(DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
                                            .onEnded { value in
                                                print(value.translation)
                                                switch(value.translation.width, value.translation.height) {
                                                case (...0, -30...30):
                                                    print("left")
                                                    completeExercise(tappedExercise: tappableExercise)
                                                case (0..., -30...30):
                                                    print("right")
                                                    completeExercise(tappedExercise: tappableExercise)
                                                case (-100...100, ...0):  print("up swipe")
                                                case (-100...100, 0...):  print("down swipe")
                                                default:  print("no clue")
                                                }
                                            }
                                        )
                                    
                                }
                                
                                
                            }
                        } else if workout == .legsDayMobility {
                            ForEach(VM.legDayMobilityExercises) { tappableExercise in
                                
                                NavigationLink(isActive: $isShowingDetailView) {
                                    WorkoutDetailView(exercise: .init(videoUrl: videoUrl, workoutTitle: detailWorkoutTitle, recommendedReps: recommendedReps))
                                } label: {
                                    ExerciseView(exercise: tappableExercise)
                                        .padding(7)
                                        .animation(.default)
                                    
                                        .onTapGesture {
                                            showDetailView(tappedExercise: tappableExercise)
                                        }
                                        .gesture(DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
                                            .onEnded { value in
                                                print(value.translation)
                                                switch(value.translation.width, value.translation.height) {
                                                case (...0, -30...30):
                                                    print("left")
                                                    completeExercise(tappedExercise: tappableExercise)
                                                case (0..., -30...30):
                                                    print("right")
                                                    completeExercise(tappedExercise: tappableExercise)
                                                case (-100...100, ...0):  print("up swipe")
                                                case (-100...100, 0...):  print("down swipe")
                                                default:  print("no clue")
                                                }
                                            }
                                        )
                                    
                                }
                                
                                
                            }
                        } else if workout == .deadliftingMobility {
                            ForEach(VM.deadliftingMobilityExercises) { tappableExercise in
                                
                                NavigationLink(isActive: $isShowingDetailView) {
                                    WorkoutDetailView(exercise: .init(videoUrl: videoUrl, workoutTitle: detailWorkoutTitle, recommendedReps: recommendedReps))
                                } label: {
                                    ExerciseView(exercise: tappableExercise)
                                        .padding(7)
                                        .animation(.default)
                                    
                                        .onTapGesture {
                                            showDetailView(tappedExercise: tappableExercise)
                                        }
                                        .gesture(DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
                                            .onEnded { value in
                                                print(value.translation)
                                                switch(value.translation.width, value.translation.height) {
                                                case (...0, -30...30):
                                                    print("left")
                                                    completeExercise(tappedExercise: tappableExercise)
                                                case (0..., -30...30):
                                                    print("right")
                                                    completeExercise(tappedExercise: tappableExercise)
                                                case (-100...100, ...0):  print("up swipe")
                                                case (-100...100, 0...):  print("down swipe")
                                                default:  print("no clue")
                                                }
                                            }
                                        )
                                    
                                }
                                
                                
                            }
                        } else if workout == .shouldersMobility {
                            ForEach(VM.shoulderMobilityExercises) { tappableExercise in
                                
                                NavigationLink(isActive: $isShowingDetailView) {
                                    WorkoutDetailView(exercise: .init(videoUrl: videoUrl, workoutTitle: detailWorkoutTitle, recommendedReps: recommendedReps))
                                } label: {
                                    ExerciseView(exercise: tappableExercise)
                                        .padding(7)
                                        .animation(.default)
                                    
                                        .onTapGesture {
                                            showDetailView(tappedExercise: tappableExercise)
                                        }
                                        .gesture(DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
                                            .onEnded { value in
                                                print(value.translation)
                                                switch(value.translation.width, value.translation.height) {
                                                case (...0, -30...30):
                                                    print("left")
                                                    completeExercise(tappedExercise: tappableExercise)
                                                case (0..., -30...30):
                                                    print("right")
                                                    completeExercise(tappedExercise: tappableExercise)
                                                case (-100...100, ...0):  print("up swipe")
                                                case (-100...100, 0...):  print("down swipe")
                                                default:  print("no clue")
                                                }
                                            }
                                        )
                                    
                                }
                                
                                
                            }
                        } else if workout == .neckPosture {
                            ForEach(VM.neckPostureExercises) { tappableExercise in
                                
                                NavigationLink(isActive: $isShowingDetailView) {
                                    WorkoutDetailView(exercise: .init(videoUrl: videoUrl, workoutTitle: detailWorkoutTitle, recommendedReps: recommendedReps))
                                } label: {
                                    ExerciseView(exercise: tappableExercise)
                                        .padding(7)
                                        .animation(.default)
                                    
                                        .onTapGesture {
                                            showDetailView(tappedExercise: tappableExercise)
                                        }
                                        .gesture(DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
                                            .onEnded { value in
                                                print(value.translation)
                                                switch(value.translation.width, value.translation.height) {
                                                case (...0, -30...30):
                                                    print("left")
                                                    completeExercise(tappedExercise: tappableExercise)
                                                case (0..., -30...30):
                                                    print("right")
                                                    completeExercise(tappedExercise: tappableExercise)
                                                case (-100...100, ...0):  print("up swipe")
                                                case (-100...100, 0...):  print("down swipe")
                                                default:  print("no clue")
                                                }
                                            }
                                        )
                                    
                                }
                                
                                
                            }
                        } else if workout == .backPosture {
                            ForEach(VM.backPostureExercises) { tappableExercise in
                                
                                NavigationLink(isActive: $isShowingDetailView) {
                                    WorkoutDetailView(exercise: .init(videoUrl: videoUrl, workoutTitle: detailWorkoutTitle, recommendedReps: recommendedReps))
                                } label: {
                                    ExerciseView(exercise: tappableExercise)
                                        .padding(7)
                                        .animation(.default)
                                    
                                        .onTapGesture {
                                            showDetailView(tappedExercise: tappableExercise)
                                        }
                                        .gesture(DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
                                            .onEnded { value in
                                                print(value.translation)
                                                switch(value.translation.width, value.translation.height) {
                                                case (...0, -30...30):
                                                    print("left")
                                                    completeExercise(tappedExercise: tappableExercise)
                                                case (0..., -30...30):
                                                    print("right")
                                                    completeExercise(tappedExercise: tappableExercise)
                                                case (-100...100, ...0):  print("up swipe")
                                                case (-100...100, 0...):  print("down swipe")
                                                default:  print("no clue")
                                                }
                                            }
                                        )
                                    
                                }
                                
                                
                            }
                        }
                        
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    .edgesIgnoringSafeArea(.all)
                    .navigationTitle(workoutTitle)
                    .navigationBarTitleDisplayMode(.large)
                    
                    
                }
            }
            .toolbar(content: {
                Button {
                    showHelpPopup = true
                } label: {
                    Image(systemName: "questionmark.circle")
                    .foregroundColor(Color("m"))
                    
                }
                
            })
            .onAppear {
                print("Appeared!")
                if UserDefaults.standard.bool(forKey: "noHelpNeeded") == true {
                    
                } else {
                    showHelpPopup = true
                }
            }
            .popup(isPresented: $showCompletePopup, type: .default, animation: .interactiveSpring(), autohideIn: 9999999999999, dragToDismiss: false, closeOnTap: false, closeOnTapOutside: false, backgroundColor: .clear) {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: UIScreen.main.bounds.width * 1, height: UIScreen.main.bounds.height * 1)
                        .foregroundColor(Color("b"))                        .shadow(color: .black.opacity(0.5), radius: 30, x: 0, y: 0)
                        .edgesIgnoringSafeArea(.all)
                    Image("PocketRehabTransparentLogo")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.width * 0.9)
                        .opacity(0.1)
                    VStack {
                        Text("Congrats! 🥳")
                            .font(.system(size: 45, weight: .bold, design: .default))
                            .bold()
                            .shadow(color: .gray, radius: 20, x: 0, y: 0)
                            .padding()
                        
                        if numberOfSessionsComplete == 1 {
                            Text("You've completed your first session!")
                            
                                .font(.system(size: 29, weight: .medium, design: .default))
                                .multilineTextAlignment(.center)
                        } else {
                            Text("You've completed \(numberOfSessionsComplete) sessions!")
                                .font(.system(size: 29, weight: .medium, design: .default))
                                .multilineTextAlignment(.center)
                        }
                        
                        HStack {
                            Button {
                                showCompletePopup = false
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(width: 150, height: 60)
                                        .foregroundColor(.red)
                                        .shadow(radius: 10)
                                    Text("Go back...")
                                        .foregroundColor(.white)
                                        .frame(width: 150, height: 50)
                                        .font(.system(size: 20, weight: .bold))
                                        .shadow(radius: 20)


                                }
                            }.padding(.horizontal)
                            Button {
                                numberOfSessionsComplete += 1
                                presentationMode.wrappedValue.dismiss()
                                presentationMode.wrappedValue.dismiss()
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(width: 150, height: 60)
                                        .foregroundColor(.green)
                                        .shadow(radius: 10)
                                    Text("Great!")
                                        .foregroundColor(.white)
                                        .frame(width: 150, height: 50)
                                        .font(.system(size: 20, weight: .bold))
                                        .shadow(radius: 20)

                                }
                            }.padding(.horizontal)
                            
                        }.padding(.top, 20)
                        
                        
                    }
                    
                }
                .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.width * 0.9)
            }
            .popup(isPresented: $showHelpPopup, type: .default, animation: .easeInOut, autohideIn: 99999999, dragToDismiss: true, closeOnTap: true, closeOnTapOutside: true, backgroundColor: .clear) {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.width * 0.8)
                        .foregroundColor(Color("b"))                        .shadow(color: .gray, radius: 20, x: 0, y: 0)
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
                        Text("To mark as complete:")
                            .font(.title)
                            .bold()
                        Text("Swipe left or right on any exercise.")
                            .font(.system(size: 18, weight: .medium, design: .default))
                            .padding(.top, 1)
                            .padding(.bottom, 25)
                        Text("To get more details:")
                            .font(.title)
                            .bold()
                        Text("Tap on any exercise.")
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
    }






struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView(VM: WorkoutViewModel(), workoutTitle: "Beginner Mobility Routine", workout: WorkoutName.fiveMinuteMobility)
    }
}
