import Foundation

enum DetailExercise {
    case catCow
    case cossackSquat
    case pikeToCobra
    case standingLatStretch
    case worldsGreatestStrecth
}

class WorkoutDetailViewModel: ObservableObject {
    
    class WorkoutDetail: ObservableObject, Identifiable {
        
        @Published var videoUrl: URL
        @Published var workoutTitle: String
        @Published var recommendedReps: String
        
        init(videoUrl: URL, workoutTitle: String, recommendedReps: String) {
            self.videoUrl = videoUrl
            self.workoutTitle = workoutTitle
            self.recommendedReps = recommendedReps
           
        }
    }
    
}






