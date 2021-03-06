//
//  UIViewController+Extension.swift
//  InstargramFirestoreTutorial
//
//  Created by 장혜령 on 2022/02/17.
//

import UIKit

extension UIViewController{
    func configureGradientLayer() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
        gradient.locations = [0, 1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }
}

//import JGProgressHUD
//
//extension UIViewController {
//    static let hud = JGProgressHUD(style: .dark)
//
//
//
//    func showLoader(_ show: Bool) {
//        view.endEditing(true)
//
//        if show {
//            UIViewController.hud.show(in: view)
//        } else {
//            UIViewController.hud.dismiss()
//        }
//    }
//
//    func showMessage(withTitle title: String, message: String) {
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
//        present(alert, animated: true, completion: nil)
//    }
//}
