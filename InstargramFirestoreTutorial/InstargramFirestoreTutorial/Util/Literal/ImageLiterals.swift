//
//  ImageLiterals.swift
//  InstargramFirestoreTutorial
//
//  Created by 장혜령 on 2022/02/17.
//

import UIKit

enum ImageLiterals {
    //MARK: - icon
    
    
    //MARK: - image
    static var venom7: UIImage { .load(name: "venom-7") }
    
}

extension UIImage {
    static func load(name: String) -> UIImage {
        guard let image = UIImage(named: name, in: nil, compatibleWith: nil) else {
            print("Image 로드 문제")
            return UIImage()
        }
        image.accessibilityIdentifier = name
        return image
    }
    
    func resize(to size: CGSize) -> UIImage {
        let image = UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
        return image
    }
}
