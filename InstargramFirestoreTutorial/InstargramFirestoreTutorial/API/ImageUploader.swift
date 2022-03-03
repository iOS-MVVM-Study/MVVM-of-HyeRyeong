//
//  ImageUploader.swift
//  InstargramFirestoreTutorial
//
//  Created by 장혜령 on 2022/03/03.
//

import UIKit
import FirebaseStorage

struct ImageUploader{
    static func uploadImage(image: UIImage, completion: @escaping (String) -> (Void)){
        guard let imageData = image.jpegData(compressionQuality: 0.75) else {return}
        let fileName = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(fileName)")
        
        ref.putData(imageData, metadata: nil) { (metadata, error) in
            if let error = error{
                print("DEBUG : Falied to upload image \(error.localizedDescription)")
            }
            ref.downloadURL{ (url, error) in
                guard let imageUrl = url?.absoluteString else {return}
                completion(imageUrl)
            }
            
        }
    }
}
