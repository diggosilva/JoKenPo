//
//  PlayerView.swift
//  JoKenPo
//
//  Created by Diggo Silva on 25/07/24.
//

import UIKit

protocol PlayerViewDelegate: AnyObject {
    func rockButtonTapped()
    func paperButtonTapped()
    func scissorButtonTapped()
}

class PlayerView: UIView {
    lazy var bgPlayer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 0.5
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 5, height: 5)
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 3.0
        return view
    }()
    
    lazy var rockButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("✊🏻", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 80)
        button.addTarget(self, action: #selector(rockButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var paperButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("✋🏻", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 80)
        button.addTarget(self, action: #selector(paperButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var scissorButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("✌🏻", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 80)
        button.addTarget(self, action: #selector(scissorButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var buttonHStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [rockButton, paperButton, scissorButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.layer.cornerRadius = 5
        stack.layer.borderWidth = 0.5
        stack.layer.borderColor = UIColor.gray.cgColor
        stack.backgroundColor = #colorLiteral(red: 0.9182699323, green: 0.9187726974, blue: 0.9341935515, alpha: 1)
        return stack
    }()
    
    weak var delegate: PlayerViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func rockButtonTapped() {
        delegate?.rockButtonTapped()
    }
    
    @objc private func paperButtonTapped() {
        delegate?.paperButtonTapped()
    }
    
    @objc private func scissorButtonTapped() {
        delegate?.scissorButtonTapped()
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy () {
        addSubviews([bgPlayer, buttonHStack])
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            bgPlayer.centerXAnchor.constraint(equalTo: centerXAnchor),
            bgPlayer.centerYAnchor.constraint(equalTo: centerYAnchor),
            bgPlayer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            bgPlayer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            bgPlayer.heightAnchor.constraint(equalToConstant: 160),
            
            buttonHStack.topAnchor.constraint(equalTo: bgPlayer.topAnchor, constant: 10),
            buttonHStack.leadingAnchor.constraint(equalTo: bgPlayer.leadingAnchor, constant: 10),
            buttonHStack.trailingAnchor.constraint(equalTo: bgPlayer.trailingAnchor, constant: -10),
            buttonHStack.bottomAnchor.constraint(equalTo: bgPlayer.bottomAnchor, constant: -10),
        ])
    }
}
