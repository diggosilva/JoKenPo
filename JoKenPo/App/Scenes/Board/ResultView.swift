//
//  ResultView.swift
//  JoKenPo
//
//  Created by Diggo Silva on 25/07/24.
//

import UIKit

class ResultView: UIView {
    lazy var bgResult: UIView = {
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
    
    lazy var yourButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("✊🏻", for: .normal)
        button.isEnabled = false
        button.titleLabel?.font = .systemFont(ofSize: 80)
        return button
    }()
    
    lazy var computerButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("✋🏻", for: .normal)
        button.isEnabled = false
        button.titleLabel?.font = .systemFont(ofSize: 80)
        return button
    }()
    
    lazy var buttonHStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [yourButton, computerButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.backgroundColor = .clear
        return stack
    }()
    
    lazy var yourLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Você"
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.6
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .headline)
        return label
    }()
    
    lazy var computerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "I.A."
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.6
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .headline)
        return label
    }()
    
    lazy var labelHStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [yourLabel, computerLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.backgroundColor = .clear
        return stack
    }()
    
    lazy var resultVStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [buttonHStack, labelHStack])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.layer.cornerRadius = 5
        stack.layer.borderWidth = 0.5
        stack.layer.borderColor = UIColor.gray.cgColor
        stack.backgroundColor = #colorLiteral(red: 0.9182699323, green: 0.9187726974, blue: 0.9341935515, alpha: 1)
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy () {
        addSubviews([bgResult, resultVStack])
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            bgResult.centerXAnchor.constraint(equalTo: centerXAnchor),
            bgResult.centerYAnchor.constraint(equalTo: centerYAnchor),
            bgResult.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            bgResult.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            bgResult.heightAnchor.constraint(equalToConstant: 160),
            
            resultVStack.topAnchor.constraint(equalTo: bgResult.topAnchor, constant: 10),
            resultVStack.leadingAnchor.constraint(equalTo: bgResult.leadingAnchor, constant: 10),
            resultVStack.trailingAnchor.constraint(equalTo: bgResult.trailingAnchor, constant: -10),
            resultVStack.bottomAnchor.constraint(equalTo: bgResult.bottomAnchor, constant: -10),
        ])
    }
}
