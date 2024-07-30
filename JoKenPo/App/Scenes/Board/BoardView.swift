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
    
    lazy var resultView: ResultView = {
        let view = ResultView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var playerView: PlayerView = {
        let view = PlayerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var bgStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [scoreView, resultView, playerView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.layer.cornerRadius = 5
        stack.layer.borderWidth = 0.5
        stack.layer.borderColor = UIColor.gray.cgColor
        stack.backgroundColor = .clear
        return stack
    }()
    
//    var victory = 0
//    var draw = 0
//    var lose = 0
    
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
        backgroundColor = .white
        addSubviews([bgStack])
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            bgStack.topAnchor.constraint(equalTo: topAnchor),
            bgStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            bgStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            bgStack.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
