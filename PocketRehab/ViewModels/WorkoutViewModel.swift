import Foundation

enum WorkoutName {
    case fiveMinuteMobility
    case tenMinuteMobility
    case fifteenMinuteMobility
    case upperBodyMobility
    case legsDayMobility
    case deadliftingMobility
    case shouldersMobility
    case neckPosture
    case backPosture
    case backPain
    case kneePain
    case shoulderPain
    case anklePain
    case neckPain
    case wristPain
    case elbowPain
}

class WorkoutViewModel: ObservableObject {
    
    func checkIfWorkoutComplete(exercises: [Exercise]) -> Double {
        var completedExercises = 0.0
        let totalExercises = Double(exercises.count) * 1.0
        for exercise in exercises {
            if exercise.isDone == true {
                completedExercises += 1
            }
        }
        print("completedExercises", completedExercises)
        print("totalExercises", totalExercises)
        print(Float(completedExercises / totalExercises))
        return Double(completedExercises / totalExercises)
    }
    class CompletedExercise: ObservableObject, Identifiable {
        
        
        var id = UUID()
        @Published var exerciseName: String
        @Published var noOfReps: Int
        @Published var noOfSets: [Int]
        @Published var isCompleted: Bool
        
        init(name: String, reps: Int, noOfSets: [Int], isCompleted: Bool) {
            self.exerciseName = name
            self.noOfSets = noOfSets
            self.noOfReps = reps
            self.isCompleted = isCompleted
        }
    }
    func updateView() {
        self.objectWillChange.send()
    }
    
    class Exercise: ObservableObject, Identifiable {
        var id = UUID()
        @Published var isDone: Bool
        @Published var imageName: String
        @Published var exerciseName: String
        
        init(isDone: Bool, imageName: String, exerciseName: String) {
            self.isDone = isDone
            self.imageName = imageName
            self.exerciseName = exerciseName
        }
    }
    
    @Published var fiveMinuteMobilityExercises = [
        
        Exercise(isDone: false, imageName: "catCow", exerciseName: "Cat and Cows"),
        Exercise(isDone: false, imageName: "worldsGreatestStretch", exerciseName: "Worlds Greatest Stretch"),
        Exercise(isDone: false, imageName: "cossackSquat", exerciseName: "Cossack Squats"),
        Exercise(isDone: false, imageName: "pikeToCobra", exerciseName: "Pike To Cobra"),
        Exercise(isDone: false, imageName: "standingLatStretch", exerciseName: "Standing Lat Stretch")]
    
    @Published var tenMinuteMobilityExercises = [
        Exercise(isDone: false, imageName: "headRotations", exerciseName: "Head Rotations"),
        Exercise(isDone: false, imageName: "pikeToCobra", exerciseName: "Pike To Cobra"),
        Exercise(isDone: false, imageName: "catCow", exerciseName: "Cat and Cows"),
        Exercise(isDone: false, imageName: "thoracicBridge", exerciseName: "Thoracic Bridges"),
        Exercise(isDone: false, imageName: "kneelingHipFlexorStretch", exerciseName: "Kneeling Hip Stretch"),
        Exercise(isDone: false, imageName: "supermanRow", exerciseName: "Superman Row"),
        Exercise(isDone: false, imageName: "bandedShoulderStretch", exerciseName: "Banded Shoulder Stretch"),
        Exercise(isDone: false, imageName: "hingeToSquat", exerciseName: "Hinge To Squat"),
        Exercise(isDone: false, imageName: "legBridge", exerciseName: "Glute Bridges"),
        Exercise(isDone: false, imageName: "burpee", exerciseName: "Burpees"),
    ]
    
    @Published var fifteenMinuteMobilityExercises = [
        Exercise(isDone: false, imageName: "headRotations", exerciseName: "Head Rotations"),
        Exercise(isDone: false, imageName: "catCow", exerciseName: "Cat and Cows"),
        Exercise(isDone: false, imageName: "standingLatStretch", exerciseName: "Standing Lat Stretch"),
        Exercise(isDone: false, imageName: "childsPose", exerciseName: "Childs Pose"),
        Exercise(isDone: false, imageName: "birdDog", exerciseName: "Bird Dogs"),
        Exercise(isDone: false, imageName: "kneelingHipFlexorStretch", exerciseName: "Kneeling Hip Stretch"),
        Exercise(isDone: false, imageName: "worldsGreatestStretch", exerciseName: "Worlds Greatest Stretch"),
        Exercise(isDone: false, imageName: "toeTouch", exerciseName: "Toe Touches"),
        Exercise(isDone: false, imageName: "pikeToCobra", exerciseName: "Pike To Cobra"),
        Exercise(isDone: false, imageName: "hingeToSquat", exerciseName: "Hinge To Squat"),
        Exercise(isDone: false, imageName: "supermanRow", exerciseName: "Superman Row"),
        Exercise(isDone: false, imageName: "legBridge", exerciseName: "Glute Bridges"),
        Exercise(isDone: false, imageName: "bandedShoulderStretch", exerciseName: "Banded Shoulder Stretch"),
        Exercise(isDone: false, imageName: "calfStretch", exerciseName: "Calf Stretch"),
        Exercise(isDone: false, imageName: "burpee", exerciseName: "Burpees")
    ]
    
    @Published var upperbodyMobilityExercises = [
        Exercise(isDone: false, imageName: "worldsGreatestStretch", exerciseName: "Worlds Greatest Stretch"),
        Exercise(isDone: false, imageName: "bandedShoulderStretch", exerciseName: "Banded Shoulder Stretch"),
        Exercise(isDone: false, imageName: "backFoamRolling", exerciseName: "Back Foam Rolling"),
        Exercise(isDone: false, imageName: "kneelingLatStretch", exerciseName: "Kneeling Lat Stretch"),
        Exercise(isDone: false, imageName: "supermanRow", exerciseName: "Superman Rows"),
        Exercise(isDone: false, imageName: "wristCircles", exerciseName: "Wrist Circles"),
        Exercise(isDone: false, imageName: "rotatorCuff", exerciseName: "Rotator Cuff Strengthening")
    ]
    
    @Published var shoulderMobilityExercises = [
        Exercise(isDone: false, imageName: "bandedShoulderStretch", exerciseName: "Banded Shoulder Stretch"),
        Exercise(isDone: false, imageName: "backFoamRolling", exerciseName: "Back Foam Rolling"),
        Exercise(isDone: false, imageName: "kneelingLatStretch", exerciseName: "Kneeling Lat Stretch"),
        Exercise(isDone: false, imageName: "supermanRow", exerciseName: "Superman Rows"),
        Exercise(isDone: false, imageName: "wristCircles", exerciseName: "Wrist Circles"),
        Exercise(isDone: false, imageName: "bandPullApart", exerciseName: "Band Pull-Apart"),
        Exercise(isDone: false, imageName: "scapulaPullup", exerciseName: "Scapular Pullups")
    ]
    
    @Published var legDayMobilityExercises = [
        Exercise(isDone: false, imageName: "supineDrawIn", exerciseName: "Belly Vacuum's"),
        Exercise(isDone: false, imageName: "catCow", exerciseName: "Cat and Cows"),
        Exercise(isDone: false, imageName: "worldsGreatestStretch", exerciseName: "Worlds Greatest Stretch"),
        Exercise(isDone: false, imageName: "birdDog", exerciseName: "Bird Dogs"),
        Exercise(isDone: false, imageName: "hingeToSquat", exerciseName: "Hinge To Squats"),
        Exercise(isDone: false, imageName: "legBridge", exerciseName: "Glute Birdges"),
        Exercise(isDone: false, imageName: "calfRolling", exerciseName: "Calf Foam-Rolling")
    ]
    
    @Published var deadliftingMobilityExercises = [
        Exercise(isDone: false, imageName: "supineDrawIn", exerciseName: "Belly Vacuum's"),
        Exercise(isDone: false, imageName: "catCow", exerciseName: "Cat and Cows"),
        Exercise(isDone: false, imageName: "worldsGreatestStretch", exerciseName: "Worlds Greatest Stretch"),
        Exercise(isDone: false, imageName: "birdDog", exerciseName: "Bird Dogs"),
        Exercise(isDone: false, imageName: "hipAbductions", exerciseName: "Hip Abductions"),
        Exercise(isDone: false, imageName: "legBridge", exerciseName: "Glute Birdges"),
        Exercise(isDone: false, imageName: "singleLegDeadlift", exerciseName: "Single Leg Deadlift")
    ]
    
    @Published var neckPostureExercises = [
        Exercise(isDone: false, imageName: "chinTucks", exerciseName: "Chin Tucks"),
        Exercise(isDone: false, imageName: "facepull", exerciseName: "Facepulls"),
        Exercise(isDone: false, imageName: "bandPullApart", exerciseName: "Band Pull Aparts")
    ]
    
    @Published var backPostureExercises = [
        Exercise(isDone: false, imageName: "legBridge", exerciseName: "Glute Bridges"),
        Exercise(isDone: false, imageName: "kneelingHipFlexorStretch", exerciseName: "Kneeling Hip Stretch"),
        Exercise(isDone: false, imageName: "legRaises", exerciseName: "Leg Raises")
    ]
    
    @Published var backPainExercises = [
        Exercise(isDone: false, imageName: "hipAbductions", exerciseName: "Hip Abductions"),
        Exercise(isDone: false, imageName: "legBridge", exerciseName: "Glute Bridges"),
        Exercise(isDone: false, imageName: "catCow", exerciseName: "Cat and Cows"),
        Exercise(isDone: false, imageName: "worldsGreatestStretch", exerciseName: "World's Greatest Stretch"),
        Exercise(isDone: false, imageName: "cablePullThrough", exerciseName: "Cable Pull Through"),
        Exercise(isDone: false, imageName: "supineDrawIn", exerciseName: "Belly Vacuums"),
        Exercise(isDone: false, imageName: "birdDog", exerciseName: "Bird Dogs")
    ]
    
    @Published var shoulderPainExercises = [
        Exercise(isDone: false, imageName: "kneelingLatStretch", exerciseName: "Kneeling Lat Stretch"),
        Exercise(isDone: false, imageName: "scapulaPullup", exerciseName: "Scapular Pullups"),
        Exercise(isDone: false, imageName: "bandPushup", exerciseName: "Banded Pushup"),
        Exercise(isDone: false, imageName: "rotatorCuff", exerciseName: "External Cable Pull"),
        Exercise(isDone: false, imageName: "bandPullApart", exerciseName: "Band Pull Apart"),
        Exercise(isDone: false, imageName: "dumbbellRaise", exerciseName: "Dumbbell Raises"),
        Exercise(isDone: false, imageName: "kettlebellPush", exerciseName: "Kettlebell Push"),
        Exercise(isDone: false, imageName: "worldsGreatestStretch", exerciseName: "Worlds Greatest Stretch"),
        Exercise(isDone: false, imageName: "backFoamRolling", exerciseName: "Back Foam Rolling"),
        Exercise(isDone: false, imageName: "supermanRow", exerciseName: "Superman Row's"),
        Exercise(isDone: false, imageName: "facepull", exerciseName: "Facepulls"),
        Exercise(isDone: false, imageName: "singleDumbbellRow", exerciseName: "Single Dumbbell Rows")
    ]
        
    @Published var kneePainExercises = [
        Exercise(isDone: false, imageName: "bulgarianSplitSquat", exerciseName: "Bulgarian Split Squats"),
        Exercise(isDone: false, imageName: "hipAbductions", exerciseName: "Hip Abductions"),
        Exercise(isDone: false, imageName: "legBridge", exerciseName: "Glute Bridges"),
        Exercise(isDone: false, imageName: "stepup", exerciseName: "Box Step Ups"),
        Exercise(isDone: false, imageName: "hamstringCurl", exerciseName: "Hamstring Curls"),
        Exercise(isDone: false, imageName: "cossackSquat", exerciseName: "Cossack Squat"),
        Exercise(isDone: false, imageName: "worldsGreatestStretch", exerciseName: "Worlds Greatest Stretch"),
        Exercise(isDone: false, imageName: "wallSit", exerciseName: "Wall Sits"),
        Exercise(isDone: false, imageName: "calfRolling", exerciseName: "Calf Foam Rolling"),
        Exercise(isDone: false, imageName: "calfRaise", exerciseName: "Calf Raises")
    ]
    
    @Published var anklePainExercises = [
        Exercise(isDone: false, imageName: "calfRolling", exerciseName: "Calf Rolling"),
        Exercise(isDone: false, imageName: "calfStretch", exerciseName: "Calf Stretching"),
        Exercise(isDone: false, imageName: "soleusStretch", exerciseName: "Soleus Stretching"),
        Exercise(isDone: false, imageName: "calfRaise", exerciseName: "Calf Raises"),
        Exercise(isDone: false, imageName: "ankleDorsiflexion", exerciseName: "Ankle Dorsiflexion"),
        Exercise(isDone: false, imageName: "anklePlantarflexion", exerciseName: "Ankle Plantarflexion"),
        Exercise(isDone: false, imageName: "ankleInversion", exerciseName: "Ankle Inversion"),
        Exercise(isDone: false, imageName: "ankleEversion", exerciseName: "Ankle Eversion"),
        Exercise(isDone: false, imageName: "ankleBalance", exerciseName: "Single Leg Balancing")
    ]
    
    @Published var neckPainExercises = [
        Exercise(isDone: false, imageName: "neckUpDownLeftRight", exerciseName: "Quad-Directional Neck Movements"),
        Exercise(isDone: false, imageName: "neckSideToSide", exerciseName: "Side To Side Neck Motion"),
        Exercise(isDone: false, imageName: "neckIsometrics", exerciseName: "Neck Isometrics"),
        Exercise(isDone: false, imageName: "chinTucks", exerciseName: "Chin Tucks"),
        Exercise(isDone: false, imageName: "facepull", exerciseName: "Face Pulls"),
        Exercise(isDone: false, imageName: "bandPullApart", exerciseName: "Band Pull Aparts")
    ]
    
    @Published var wristPainExercises = [
        Exercise(isDone: false, imageName: "wristCircles", exerciseName: "Wrist Circles"),
        Exercise(isDone: false, imageName: "wristFlexorStretch", exerciseName: "Wrist Flexor Stretch"),
        Exercise(isDone: false, imageName: "wristExtensorStretch", exerciseName: "Wrist Extensor Stretch"),
        Exercise(isDone: false, imageName: "wristCurl", exerciseName: "Wrist Curl"),
        Exercise(isDone: false, imageName: "reverseWristCurl", exerciseName: "Reverse Wrist Curl"),
        Exercise(isDone: false, imageName: "wristPronationSupination", exerciseName: "Wrist Pronation and Supination"),
        Exercise(isDone: false, imageName: "radialUlnarDeviation", exerciseName: "Radial / Ulnar Deviation")
    ]
    
    @Published var elbowPainExercises = [
        Exercise(isDone: false, imageName: "farmersWalks", exerciseName: "Farmers Walks"),
        Exercise(isDone: false, imageName: "wristFlexorStretch", exerciseName: "Wrist Flexor Stretch"),
        Exercise(isDone: false, imageName: "wristExtensorStretch", exerciseName: "Wrist Extensor Stretch"),
        Exercise(isDone: false, imageName: "wristCurl", exerciseName: "Wrist Curl"),
        Exercise(isDone: false, imageName: "reverseWristCurl", exerciseName: "Reverse Wrist Curl"),
        Exercise(isDone: false, imageName: "scapulaPullup", exerciseName: "Scapular Pullups"),
        Exercise(isDone: false, imageName: "facepull", exerciseName: "Facepulls")
    ]
    
}





