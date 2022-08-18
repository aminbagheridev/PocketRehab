//
//  PainMapViewModel.swift
//  PocketRehab
//
//  Created by Amin  Bagheri  on 2022-07-16.
//

import Foundation

class PainMapViewModel: ObservableObject {
    
    @Published var tappedKnee: Bool = false
    @Published var tappedNeck: Bool = false
    @Published var tappedAShoulder: Bool = false
    @Published var tappedLowerback: Bool = false
    @Published var tappedAnkle: Bool = false
    @Published var tappedHip: Bool = false
    @Published var tappedElbow: Bool = false
    @Published var tappedInnerElbow: Bool = false
    @Published var tappedWrist: Bool = false
    
    //MARK: KNEE STATIC RATIOS
    let kneeLowX: Float = 0.30
    let kneeHighX: Float = 0.67
    let kneeLowY: Float = 0.63
    let kneeHighY: Float = 0.85
    func checkForKnee(tappedX: Float, tappedY: Float, imageWidth: Float, imageHeight: Float) {
        guard imageWidth != 0, imageWidth != 0.0, imageHeight != 0, imageHeight != 0.0 else {
            print("ERROR: Image width or height is 0.")
            return
        }
        
        print("VM_tappedX", tappedX)
        print("VM_tappedY", tappedY)
        print("VM_imageWidth", imageWidth)
        print("VM_imageHeight", imageHeight)



        
        let xRatio = (tappedX / imageWidth)
        print("X RATIO", xRatio)
        let yRatio = (tappedY / imageHeight)
        print("Y RATIO", yRatio)


        if  (xRatio > kneeLowX && xRatio < kneeHighX) && (yRatio > kneeLowY && yRatio < kneeHighY) {
            print("Knee tapped!")
            tappedKnee = true
        } else {
            print("Knee not tapped.")
            tappedKnee = false
        }
    }
    
    //MARK: NECK STATIC RATIOS
    let neckLowX: Float = 0.45
    let neckHighX: Float = 0.57
    let neckLowY: Float = 0.07
    let neckHighY: Float = 0.22
    func checkForNeck(tappedX: Float, tappedY: Float, imageWidth: Float, imageHeight: Float) {
        guard imageWidth != 0, imageWidth != 0.0, imageHeight != 0, imageHeight != 0.0 else {
            print("ERROR: Image width or height is 0.")
            return
        }
        
        print("VM_tappedX", tappedX)
        print("VM_tappedY", tappedY)
        print("VM_imageWidth", imageWidth)
        print("VM_imageHeight", imageHeight)

        let xRatio = (tappedX / imageWidth)
        print("X RATIO", xRatio)
        let yRatio = (tappedY / imageHeight)
        print("Y RATIO", yRatio)


        if  (xRatio > neckLowX && xRatio < neckHighX) && (yRatio > neckLowY && yRatio < neckHighY) {
            print("Neck tapped!")
            tappedNeck = true
        } else {
            print("Neck not tapped.")
            tappedNeck = false
        }
    }
    
    //MARK: SHOULDER STATIC RATIOS
    let rightShoulderLowX: Float = 0.50
    let rightShoulderHighX: Float = 0.75
    let rightShoulderLowY: Float = 0.13
    let rightShoulderHighY: Float = 0.30
    
    let leftShoulderLowX: Float = 0.25
    let leftShoulderHighX: Float = 0.5
    let leftShoulderLowY: Float = 0.10
    let leftShoulderHighY: Float = 0.30
    func checkForShoulder(tappedX: Float, tappedY: Float, imageWidth: Float, imageHeight: Float) {
        guard imageWidth != 0, imageWidth != 0.0, imageHeight != 0, imageHeight != 0.0 else {
            print("ERROR: Image width or height is 0.")
            return
        }
        
        print("VM_tappedX", tappedX)
        print("VM_tappedY", tappedY)
        print("VM_imageWidth", imageWidth)
        print("VM_imageHeight", imageHeight)

        let xRatio = (tappedX / imageWidth)
        print("X RATIO", xRatio)
        let yRatio = (tappedY / imageHeight)
        print("Y RATIO", yRatio)


        if  (xRatio > leftShoulderLowX && xRatio < leftShoulderHighX) && (yRatio > leftShoulderLowY && yRatio < leftShoulderHighY) || (xRatio > rightShoulderLowX && xRatio < rightShoulderHighX) && (yRatio > rightShoulderLowY && yRatio < rightShoulderHighY) {
            print("Shoulders tapped!")
            tappedAShoulder = true
        } else {
            print("Shoulders not tapped.")
            tappedAShoulder = false
        }
    }
    
    //MARK: LOWBACK STATIC RATIOS
    let lowBackLowX: Float = 0.4
    let lowBackHighX: Float = 0.6
    let lowBackLowY: Float = 0.30
    let lowBackHighY: Float = 0.6
    func checkForLowback(tappedX: Float, tappedY: Float, imageWidth: Float, imageHeight: Float) {
        guard imageWidth != 0, imageWidth != 0.0, imageHeight != 0, imageHeight != 0.0 else {
            print("ERROR: Image width or height is 0.")
            return
        }
        
        print("VM_tappedX", tappedX)
        print("VM_tappedY", tappedY)
        print("VM_imageWidth", imageWidth)
        print("VM_imageHeight", imageHeight)

        let xRatio = (tappedX / imageWidth)
        print("X RATIO", xRatio)
        let yRatio = (tappedY / imageHeight)
        print("Y RATIO", yRatio)


        if  (xRatio > lowBackLowX && xRatio < lowBackHighX) && (yRatio > lowBackLowY && yRatio < lowBackHighY) {
            print("Lowback tapped!")
            tappedLowerback = true
        } else {
            print("lowerback not tapped.")
            tappedLowerback = false
        }
    }
    
    //MARK: ANKLE STATIC RATIOS
    let ankleLowX: Float = 0.35
    let ankleHighX: Float = 0.70
    let ankleLowY: Float = 0.85
    let ankleHighY: Float = 0.99
    func checkForAnkle(tappedX: Float, tappedY: Float, imageWidth: Float, imageHeight: Float) {
        guard imageWidth != 0, imageWidth != 0.0, imageHeight != 0, imageHeight != 0.0 else {
            print("ERROR: Image width or height is 0.")
            return
        }
        
        print("VM_tappedX", tappedX)
        print("VM_tappedY", tappedY)
        print("VM_imageWidth", imageWidth)
        print("VM_imageHeight", imageHeight)

        let xRatio = (tappedX / imageWidth)
        print("X RATIO", xRatio)
        let yRatio = (tappedY / imageHeight)
        print("Y RATIO", yRatio)


        if  (xRatio > ankleLowX && xRatio < ankleHighX) && (yRatio > ankleLowY && yRatio < ankleHighY) {
            print("Ankle tapped!")
            tappedAnkle = true
        } else {
            print("Ankle not tapped.")
            tappedAnkle = false
        }
    }
    
    //MARK: HIP STATIC RATIOS
    let rightHipLowX: Float = 0.54
    let rightHipHighX: Float = 0.6
    let rightHipLowY: Float = 0.4
    let rightHipHighY: Float = 0.48
    let leftHipLowX: Float = 0.37
    let leftHipHighX: Float = 0.45
    let leftHipLowY: Float = 0.4
    let leftHipHighY: Float = 0.48
    func checkForHip(tappedX: Float, tappedY: Float, imageWidth: Float, imageHeight: Float) {
        guard imageWidth != 0, imageWidth != 0.0, imageHeight != 0, imageHeight != 0.0 else {
            print("ERROR: Image width or height is 0.")
            return
        }
        
        print("VM_tappedX", tappedX)
        print("VM_tappedY", tappedY)
        print("VM_imageWidth", imageWidth)
        print("VM_imageHeight", imageHeight)

        let xRatio = (tappedX / imageWidth)
        print("X RATIO", xRatio)
        let yRatio = (tappedY / imageHeight)
        print("Y RATIO", yRatio)


        if  (xRatio > leftHipLowX && xRatio < leftHipHighX) && (yRatio > leftHipLowY && yRatio < leftHipHighY) || (xRatio > rightHipLowX && xRatio < rightHipHighX) && (yRatio > rightHipLowY && yRatio < rightHipHighY) {
            print("Hips tapped!")
            tappedHip = true
        } else {
            print("Hips not tapped.")
            tappedHip = false
        }
    }
    
    //MARK: WRIST STATIC RATIOS
    let rightWristLowX: Float = 0.60
    let rightWristHighX: Float = 0.78
    let rightWristLowY: Float = 0.38
    let rightWristHighY: Float = 0.6
    let leftWristLowX: Float = 0.25
    let leftWristHighX: Float = 0.40
    let leftWristLowY: Float = 0.38
    let leftWristHighY: Float = 0.6
    func checkForWrist(tappedX: Float, tappedY: Float, imageWidth: Float, imageHeight: Float) {
        guard imageWidth != 0, imageWidth != 0.0, imageHeight != 0, imageHeight != 0.0 else {
            print("ERROR: Image width or height is 0.")
            return
        }
        
        print("VM_tappedX", tappedX)
        print("VM_tappedY", tappedY)
        print("VM_imageWidth", imageWidth)
        print("VM_imageHeight", imageHeight)

        let xRatio = (tappedX / imageWidth)
        print("X RATIO", xRatio)
        let yRatio = (tappedY / imageHeight)
        print("Y RATIO", yRatio)


        if  (xRatio > leftWristLowX && xRatio < leftWristHighX) && (yRatio > leftWristLowY && yRatio < leftWristHighY) || (xRatio > rightWristLowX && xRatio < rightWristHighX) && (yRatio > rightWristLowY && yRatio < rightWristHighY) {
            print("Wrists tapped!")
            tappedWrist = true
        } else {
            print("Wrists not tapped.")
            tappedWrist = false
        }
    }
    
    //MARK: ELBOW STATIC RATIOS
    let rightElbowLowX: Float = 0.58
    let rightElbowHighX: Float = 0.72
    let rightElbowLowY: Float = 0.3
    let rightElbowHighY: Float = 0.40
    
    let leftElbowLowX: Float = 0.27
    let leftElbowHighX: Float = 0.43
    let leftElbowLowY: Float = 0.3
    let leftElbowHighY: Float = 0.40
    func checkForElbow(tappedX: Float, tappedY: Float, imageWidth: Float, imageHeight: Float) {
        guard imageWidth != 0, imageWidth != 0.0, imageHeight != 0, imageHeight != 0.0 else {
            print("ERROR: Image width or height is 0.")
            return
        }
        
        print("VM_tappedX", tappedX)
        print("VM_tappedY", tappedY)
        print("VM_imageWidth", imageWidth)
        print("VM_imageHeight", imageHeight)

        let xRatio = (tappedX / imageWidth)
        print("X RATIO", xRatio)
        let yRatio = (tappedY / imageHeight)
        print("Y RATIO", yRatio)


        if  (xRatio > leftElbowLowX && xRatio < leftElbowHighX) && (yRatio > leftElbowLowY && yRatio < leftElbowHighY) || (xRatio > rightElbowLowX && xRatio < rightElbowHighX) && (yRatio > rightElbowLowY && yRatio < rightElbowHighY) {
            print("Elbows tapped!")
            tappedElbow = true
        } else {
            print("Elbows not tapped.")
            tappedElbow = false
        }
    }
}
