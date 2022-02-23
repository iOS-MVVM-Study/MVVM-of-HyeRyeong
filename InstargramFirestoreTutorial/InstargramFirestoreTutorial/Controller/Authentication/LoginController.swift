//
//  LoginController.swift
//  InstargramFirestoreTutorial
//
//  Created by 장혜령 on 2022/02/23.
//

import UIKit

class LoginController: UIViewController{
    
    //MARK: - Properties
    
    private let iconImage: UIImageView = {
        let imageView = UIImageView(image: ImageLiterals.instagramLogoWhite)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let emailTextField: UITextField = {
        let textField = CustomTextField(placeholder: "Email")
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = CustomTextField(placeholder: "Password")
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemIndigo
        button.layer.cornerRadius = 5
        button.setHeight(50) // stack view에 넣을 때 크기
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return button
    }()
    
    private let dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(firstPart: "Don't have an account?  ", secondPart: "Sign Up")
        return button
    }()
    
    private let forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(firstPart: "Forgot you password? ", secondPart: "Get help signing in.")
        return button
    }()
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: Helpers
    
    func configureUI(){
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        
        view.addSubview(iconImage)
        iconImage.centerX(inView: view)
        iconImage.setDimensions(height: 80, width: 120)
        iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        
        configureGradirentBackgroundView()
        configureButtons()
        configureTextField()
    }
     
    private func configureTextField(){
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField,
                                                       loginButton, forgotPasswordButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        
        view.addSubview(stackView)
        stackView.anchor(top: iconImage.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,
                         paddingTop: 32, paddingLeft: 32, paddingRight: 32)
    }
    
    private func configureGradirentBackgroundView(){
        let gradirent = CAGradientLayer()
        gradirent.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
        gradirent.locations = [0,1]
        view.layer.addSublayer(gradirent)
        gradirent.frame = view.frame
    }
    
    private func configureButtons(){
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.centerX(inView: view)
        dontHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
    }
}
