//
//  ProfileCell.swift
//  InstargramFirestoreTutorial
//
//  Created by 장혜령 on 2022/03/04.
//

import UIKit

class ProfileCell: UICollectionViewCell{
    
    // MARK: - Properites
    private let imageView: UIImageView = {
        let imageView = UIImageView(image: ImageLiterals.venom7)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    // MARK: - Life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .yellow
        
        addSubview(imageView)
        imageView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
