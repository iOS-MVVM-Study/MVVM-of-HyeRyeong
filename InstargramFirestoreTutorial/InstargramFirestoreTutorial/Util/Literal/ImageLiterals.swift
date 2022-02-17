//
//  ImageLiterals.swift
//  InstargramFirestoreTutorial
//
//  Created by 장혜령 on 2022/02/17.
//

import UIKit

enum ImageLiterals {
    //MARK: - icon
    static var icCancelShadow: UIImage { .load(name: "cancel_shadow") }
    static var icComment: UIImage { .load(name: "comment") }
    static var icGear: UIImage { .load(name: "gear") }
    static var icGrid: UIImage { .load(name: "grid") }
    static var icHomeSelected: UIImage { .load(name: "home_selected") }
    static var icHomeUnselected: UIImage { .load(name: "home_unselected") }
    static var icLikeSelected: UIImage { .load(name: "like_selected") }
    static var icLikeUnselected: UIImage { .load(name: "like_unselected") }
    static var icList: UIImage { .load(name: "list") }
    static var icPlay: UIImage { .load(name: "play") }
    static var icPlusPhoto: UIImage { .load(name: "plus_photo") }
    static var icPlusUnselected: UIImage { .load(name: "plus_unselected") }
    
    static var icProfileSelected: UIImage { .load(name: "profile_selected") }
    static var icProfileUnselected: UIImage { .load(name: "profile_unselected") }
    static var icRibbon: UIImage { .load(name: "ribbon") }
    static var icRightArrowShadow: UIImage { .load(name: "right_arrow_shadow") }
    static var icSaveShadow: UIImage { .load(name: "save_shadow") }
    static var icSearchSelected: UIImage { .load(name: "search_selected") }
    static var icSearchUnselected: UIImage { .load(name: "search_unselected") }
    static var icUploadImageIcon: UIImage { .load(name: "upload_image_icon") }
    
    static var icSend: UIImage { .load(name: "send2") }
    
    //MARK: - image
    static var venom7: UIImage { .load(name: "venom-7") }
    static var instagramLogoWhite: UIImage { .load(name: "Instagram_logo_white") }
    
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
