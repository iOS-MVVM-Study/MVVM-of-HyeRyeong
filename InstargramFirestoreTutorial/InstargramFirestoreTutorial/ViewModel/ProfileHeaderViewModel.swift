//
//  ProfileHeaderViewModel.swift
//  InstargramFirestoreTutorial
//
//  Created by 장혜령 on 2022/03/16.
//

import Foundation

struct ProfileHeaderViewModel {
    let user: User
    
    var fullName: String {
        return user.fullName
    }
    
    var profileImageUrl: URL? {
        return URL(string: user.profileImageUrl)
    }
    
    init(user: User) {
        self.user = user
    }
}
