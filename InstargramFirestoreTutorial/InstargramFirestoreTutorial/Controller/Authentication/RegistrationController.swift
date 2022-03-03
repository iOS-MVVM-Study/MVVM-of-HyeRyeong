//
//  RegistrationController.swift
//  InstargramFirestoreTutorial
//
//  Created by 장혜령 on 2022/02/23.
//

import UIKit

class RegistrationController: UIViewController{
    
    // MARK: - Properties
    
    private var viewModel = RegistrationViewModel()
    private var profileImage: UIImage?
    
    
    private let plusPhotoButton: UIButton = {
        let buttton = UIButton(type: .system)
        buttton.setImage(ImageLiterals.icPlusPhoto, for: .normal)
        buttton.tintColor = .white
        buttton.addTarget(self, action: #selector(handleProfilePhotoSelect),
                          for: .touchUpInside)
        return buttton
    }()
    
    private let emailTextField: UITextField = {
        let textField = CustomTextField(placeholder: "Email")
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = CustomTextField(placeholder: "Password")
        textField.isSecureTextEntry = true
        //textField.textContentType = .oneTimeCode
        return textField
    }()
    
    private let fullNameTextField = CustomTextField(placeholder: "Full name")
    private let userNameTextField = CustomTextField(placeholder: "User name")
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.isEnabled = false
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemIndigo
        button.layer.cornerRadius = 5
        button.setHeight(50) // stack view에 넣을 때 크기
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        return button
    }()
    
    private lazy var alreadyHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(firstPart: "Already have an account?", secondPart: "Log In")
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
        return button
    }()
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureNotificationObservers()
    }
    
    //MARK: Actions
    
    @objc
    private func handleSignUp(){
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        guard let fullName = fullNameTextField.text else { return }
        guard let userName = userNameTextField.text else { return }
        guard let profileImage = self.profileImage else { return }
        let credentials = AuthCredentials(email: email,
                                          password: password,
                                          fullName: fullName,
                                          userName: userName,
                                          profileImage: profileImage) 
        AuthService.registerUser(withCredential: credentials){ error in
            if let error = error{
                print("DEBUG : Falied to registerUser \(error.localizedDescription)")
                return
            }
            
            print("DEBUG: Successfully registered user with firestore..")
        }
    }
    
    @objc
    private func handleShowLogin(){
        navigationController?.popViewController(animated: true)
   
    }
    
    @objc
    private func textDidChange(sender: UITextField){
        if sender == emailTextField{
            viewModel.email = sender.text
        }else if sender == passwordTextField{
            viewModel.password = sender.text
        }else if sender == fullNameTextField{
            viewModel.fullName = sender.text
        }else{
            viewModel.userName = sender.text
        }
        updateForm()
    }
    
    @objc
    private func handleProfilePhotoSelect(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        present(picker, animated: true, completion: nil)
    }
    
    //MARK: - Helper
    private func configureUI(){
        configureGradientLayer()
        
        view.addSubview(plusPhotoButton)
        plusPhotoButton.centerX(inView: view)
        plusPhotoButton.setDimensions(height: 140, width: 140)
        plusPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        configureTextField()
        
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.centerX(inView: view)
        alreadyHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
    }
    
    private func configureTextField(){
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField,
                                                       fullNameTextField, userNameTextField,
                                                       signUpButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        
        view.addSubview(stackView)
        stackView.anchor(top: plusPhotoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,
                         paddingTop: 32, paddingLeft: 32, paddingRight: 32)
    }
    
    func configureNotificationObservers(){
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        fullNameTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        userNameTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
}

//MARK: - FormViewModel
extension RegistrationController: FormViewModel{
    func updateForm() {
        signUpButton.backgroundColor = viewModel.buttonBackGroundColor
        signUpButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
        signUpButton.isEnabled = viewModel.formIsValid
    }
}

//MARK: - UIImagePickerControllerDelegate
extension RegistrationController: UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.editedImage] as? UIImage else {return}
        profileImage = selectedImage
        plusPhotoButton.layer.cornerRadius = plusPhotoButton.frame.width / 2
        plusPhotoButton.layer.masksToBounds = true
        plusPhotoButton.layer.borderColor = UIColor.white.cgColor
        plusPhotoButton.layer.borderWidth = 2
        plusPhotoButton.setImage(selectedImage.withRenderingMode(.alwaysOriginal), for: .normal)
        
        self.dismiss(animated: true, completion: nil)
    }
}

//MARK: - UINavigationControllerDelegate
extension RegistrationController: UINavigationControllerDelegate{
    
}
