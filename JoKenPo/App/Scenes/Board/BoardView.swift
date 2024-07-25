//
//  BoardView.swift
//  JoKenPo
//
//  Created by Diggo Silva on 25/07/24.
//

import UIKit

class BoardView: UIView {
    lazy var scoreView: ScoreView = {
        let view = ScoreView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var playerView: PlayerView = {
        let view = PlayerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var bgStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [scoreView, playerView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.layer.cornerRadius = 5
        stack.layer.borderWidth = 0.5
        stack.layer.borderColor = UIColor.gray.cgColor
        stack.backgroundColor = .clear
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
        addSubviews([bgStack])
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            bgStack.topAnchor.constraint(equalTo: topAnchor),
            bgStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            bgStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            bgStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            
//            scoreView.centerXAnchor.constraint(equalTo: centerXAnchor),
//            scoreView.centerYAnchor.constraint(equalTo: centerYAnchor),
//            scoreView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            scoreView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}

class ScoreView: UIView {
    lazy var bgScore: UIView = {
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
    
    lazy var victoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Vitórias"
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.6
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .headline)
        return label
    }()
    
    lazy var drawLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Empates"
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.6
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .headline)
        return label
    }()
    
    lazy var loseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Derrotas"
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.6
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .headline)
        return label
    }()
    
    lazy var labelHStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [victoryLabel, drawLabel, loseLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.backgroundColor = .clear
        return stack
    }()
    
    lazy var valueVictoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "99"
        label.textColor = .black
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .subheadline)
        return label
    }()
    
    lazy var valueDrawLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "99"
        label.textColor = .black
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .subheadline)
        return label
    }()
    
    lazy var valueLoseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "99"
        label.textColor = .black
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .subheadline)
        return label
    }()
    
    lazy var valueHStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [valueVictoryLabel, valueDrawLabel, valueLoseLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.backgroundColor = .clear
        return stack
    }()
    
    lazy var vStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [labelHStack, valueHStack])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.layer.cornerRadius = 5
        stack.layer.borderWidth = 0.5
        stack.layer.borderColor = UIColor.gray.cgColor
        stack.backgroundColor = #colorLiteral(red: 0.9182699323, green: 0.9187726974, blue: 0.9341935515, alpha: 1)
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
        addSubviews([bgScore, vStack])
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            bgScore.centerXAnchor.constraint(equalTo: centerXAnchor),
            bgScore.centerYAnchor.constraint(equalTo: centerYAnchor),
            bgScore.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            bgScore.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            bgScore.heightAnchor.constraint(equalToConstant: 100),
            
            vStack.topAnchor.constraint(equalTo: bgScore.topAnchor, constant: 10),
            vStack.leadingAnchor.constraint(equalTo: bgScore.leadingAnchor, constant: 10),
            vStack.trailingAnchor.constraint(equalTo: bgScore.trailingAnchor, constant: -10),
            vStack.bottomAnchor.constraint(equalTo: bgScore.bottomAnchor, constant: -10),
        ])
    }
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
        return button
    }()
    
    lazy var paperButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("✋🏻", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 80)
        return button
    }()
    
    lazy var scissorButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("✌🏻", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 80)
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
