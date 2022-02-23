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
    
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
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
    
    private let dontHaveAccountButton = UIButton(type: .system)
    private let forgotPasswordButton = UIButton(type: .system)
    
    
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
        setupAttribute(in: emailTextField, attributedString: "Email")
        setupAttribute(in: passwordTextField, attributedString: "Password")
        passwordTextField.isSecureTextEntry = true
        
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
        setupArrtibute(in: dontHaveAccountButton,
                       normal: "Don't have an account?   ",
                       bold: "Sign Up")
        
        setupArrtibute(in: forgotPasswordButton,
                       normal: "Forgot you password? ",
                       bold: "Get help signing in.")
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.centerX(inView: view)
        dontHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
    }
    
    private func setupAttribute(in textField: UITextField, attributedString: String){
        textField.borderStyle = .none
        textField.textColor = .white
        textField.keyboardAppearance = .dark
        textField.keyboardType = .emailAddress
        textField.backgroundColor = UIColor(white: 1, alpha: 0.1)
        textField.attributedPlaceholder = NSAttributedString(string: attributedString,
                                                             attributes: [.foregroundColor : UIColor(white: 1, alpha: 0.7)])
        textField.setHeight(50)
    }
    
    private func setupArrtibute(in button: UIButton, normal: String, bold: String){
        let attributes: [NSAttributedString.Key : Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.7),
                                                          .font : UIFont.systemFont(ofSize: 16)]
        let attributedTitle = NSMutableAttributedString(string: normal, attributes: attributes)
        let boldAttributes: [NSAttributedString.Key : Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.7),
                                                              .font : UIFont.systemFont(ofSize: 16, weight: .bold)]
       
        attributedTitle.append(NSAttributedString(string: bold, attributes: boldAttributes))
        button.setAttributedTitle(attributedTitle, for: .normal)
    }
                                                                    
}
