//
//  AuthenticationViewModel.swift
//  InstargramFirestoreTutorial
//
//  Created by 장혜령 on 2022/02/23.
//

import UIKit

protocol FormViewModel{
    func updateForm()
}

protocol AuthenticationViewModel{
    var formIsValid: Bool { get }
    var buttonBackGroundColor: UIColor { get }
    var buttonTitleColor: UIColor { get }
}

struct LoginViewModel: AuthenticationViewModel{
    var email: String?
    var password: String?
    
    var formIsValid: Bool{
        return email?.isEmpty == false && password?.isEmpty == false
    }
    
    var buttonBackGroundColor: UIColor{
        return formIsValid ? .systemPurple : .systemIndigo.withAlphaComponent(0.5)
    }
    
    var buttonTitleColor: UIColor{
        return formIsValid ? .white : UIColor(white: 1, alpha: 0.67)
    }
}

struct RegistrationViewModel: AuthenticationViewModel{
    var email: String?
    var password: String?
    var fullName: String?
    var userName: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
        && fullName?.isEmpty == false && userName?.isEmpty == false
    }
    
    var buttonBackGroundColor: UIColor{
        return formIsValid ? .systemPurple : .systemIndigo.withAlphaComponent(0.5)
    }
    
    var buttonTitleColor: UIColor{
        return formIsValid ? .white : UIColor(white: 1, alpha: 0.67)
    }
}
