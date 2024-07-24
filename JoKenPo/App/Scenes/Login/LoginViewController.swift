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
    }
    
    private func setNavBar() {
        title = "JoKenPo"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}
