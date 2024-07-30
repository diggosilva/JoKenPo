//
//  LoginViewController.swift
//  JoKenPo
//
//  Created by Diggo Silva on 24/07/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let loginView = LoginView()
    
    override func loadView() {
        super.loadView()
        view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        setDelegatesAndDataSources()
    }
    
    private func setNavBar() {
        title = "JoKenPo"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
    }
    
    private func setDelegatesAndDataSources() {
        loginView.nameTextfield.delegate = self
        loginView.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.25) {
            self.loginView.nameTextfield.layer.borderWidth = 1
            self.loginView.nameTextfield.layer.borderColor = UIColor.lightGray.cgColor
            self.loginView.nameTextfield.layer.cornerRadius = 5
            self.highlightTextField(textField: textField, isSelected: true)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.25) {
            textField.layer.borderColor = UIColor.lightGray.cgColor
            textField.layer.borderWidth = 1
            textField.layer.cornerRadius = 5
            self.highlightTextField(textField: textField, isSelected: false)
        }
    }
    
    private func highlightTextField(textField: UITextField, isSelected: Bool) {
        if isSelected == true {
            UIView.animate(withDuration: 0.25) {
                textField.layer.shadowOffset = CGSize(width: 5, height: 5)
                textField.layer.shadowOpacity = 0.5
                textField.layer.shadowRadius = 5
                textField.layer.shadowColor = UIColor.black.cgColor
            }
        } else {
            UIView.animate(withDuration: 0.25) {
                textField.layer.shadowOffset = CGSize(width: 0, height: 0)
                textField.layer.shadowOpacity = 0
                textField.layer.shadowRadius = 0
                textField.layer.shadowColor = UIColor.black.cgColor
            }
        }
    }
}

extension LoginViewController: LoginViewDelegate {
    func textFieldDidChange() {
        let text = loginView.nameTextfield.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        loginView.startButton.isEnabled = !text.isEmpty
        
        if loginView.startButton.isEnabled {
            UIView.animate(withDuration: 0.10) {
                self.loginView.startButton.alpha = 1.0
                self.loginView.startButton.backgroundColor = .link
            }
        } else {
            UIView.animate(withDuration: 0.10) {
                self.loginView.startButton.alpha = 0.5
                self.loginView.startButton.backgroundColor = .lightGray
            }
        }
    }
    
    func buttonTapped() {
        guard let username = self.loginView.nameTextfield.text?.trimmingCharacters(in: .whitespacesAndNewlines), !username.isEmpty else {
            return
        }
        
        let nameComponents = username.components(separatedBy: .whitespaces)
        let firstName = nameComponents.first

        let boardVC = BoardViewController()
        boardVC.title = "Olá, \(username)!"
        boardVC.boardView.resultView.yourLabel.text = firstName
        
        if let navigationController = self.navigationController {
            navigationController.pushViewController(boardVC, animated: false)
            UIView.transition(with: navigationController.view,
                              duration: 0.5,
                              options: .transitionFlipFromRight,
                              animations: nil,
                              completion: nil)
        } else {
            self.present(boardVC, animated: false, completion: nil)
            UIView.transition(with: self.view,
                              duration: 0.5,
                              options: .transitionFlipFromRight,
                              animations: nil,
                              completion: nil)
        }
    }
}
