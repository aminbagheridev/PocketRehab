//
//  imageToData.swift
//  PocketRehab
//
//  Created by Amin  Bagheri  on 2022-07-22.
//

import Foundation
import SwiftUI

func dataFromImage(_ image: Image?) -> Data? {
    if image == nil {
        
        let uiImage = UIImage(named: "person")
        if let imageData = uiImage!.jpegData(compressionQuality: 0.6) {
            return imageData
        } else {
            print("Failed to turn image to data")
        }
    } else if image != nil {
        let uiImage = image!.asUIImage()
        if let imageData = uiImage.jpegData(compressionQuality: 0.6) {
            return imageData
        } else {
            print("Failed to turn image to data")
        }
    }
    return nil
}
