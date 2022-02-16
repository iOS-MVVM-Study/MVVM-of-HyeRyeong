//
//  Extension+NSObject.swift
//  InstargramFirestoreTutorial
//
//  Created by 장혜령 on 2022/02/17.
//

import Foundation

extension NSObject{
    static var className: String{
        return String(describing: self)
    }
    
}

