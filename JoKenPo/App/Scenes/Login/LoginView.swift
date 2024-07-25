//
//  LoginView.swift
//  JoKenPo
//
//  Created by Diggo Silva on 24/07/24.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
    func textFieldDidChange()
    func buttonTapped()
}

class LoginView: UIView {
    lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var nameTextfield: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.attributedPlaceholder = NSAttributedString(string: "Digite seu nome...", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        tf.clearButtonMode = .whileEditing
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .words
        tf.textColor = .black
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.layer.borderWidth = 1
        tf.layer.cornerRadius = 5
        tf.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        return tf
    }()
    
    lazy var startButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Jogar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.backgroundColor = .lightGray
        button.alpha = 0.5
        button.isEnabled = false
        return button
    }()
    
    weak var delegate: LoginViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func textFieldDidChange() {
        delegate?.textFieldDidChange()
    }
    
    @objc private func buttonTapped() {
        delegate?.buttonTapped()
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        backgroundColor = .white
        addSubviews([logoImage, nameTextfield, startButton])
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            logoImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImage.widthAnchor.constraint(equalToConstant: 200),
            logoImage.heightAnchor.constraint(equalTo: logoImage.widthAnchor),
            
            nameTextfield.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 20),
            nameTextfield.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nameTextfield.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            nameTextfield.heightAnchor.constraint(equalToConstant: 40),
            
            startButton.topAnchor.constraint(equalTo: nameTextfield.bottomAnchor, constant: 20),
            startButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            startButton.widthAnchor.constraint(equalToConstant: 200),
            startButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}
