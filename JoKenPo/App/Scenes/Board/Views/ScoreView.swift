//
//  ScoreView.swift
//  JoKenPo
//
//  Created by Diggo Silva on 25/07/24.
//

import UIKit

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
        label.text = "0"
        label.textColor = .black
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .headline)
        return label
    }()
    
    lazy var valueDrawLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        label.textColor = .black
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .headline)
        return label
    }()
    
    lazy var valueLoseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        label.textColor = .black
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .headline)
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
