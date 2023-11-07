//
//  QuizzlerView.swift
//  Quizzler
//
//  Created by Liz-Mary on 05.11.2023.
//

import UIKit

protocol QuizzlerDelegate: AnyObject {
    func answerButtonPressed(_ sender: UIButton)
}

class QuizzlerView: UIView {
    
    weak var delegate: QuizzlerDelegate?
    
    lazy var questionLabel: UILabel = {
        let element = UILabel()
        element.font = .systemFont(ofSize: 30)
        element.textColor = .white
        element.numberOfLines = 0
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    lazy var scoreLabel: UILabel = {
        let element = UILabel()
        element.text = "Score: 0/12"
        element.font = .systemFont(ofSize: 20)
        element.textColor = .white
        element.numberOfLines = 0
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    lazy var progressView: UIProgressView = {
        let element = UIProgressView()
        element.progressTintColor = .magenta
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    lazy var footerImageView: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "Background-Bubbles")
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    let trueButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.backgroundColor = UIColor(named: "Color")
        button.layer.cornerRadius = 17
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        return button
    }()
    
    let falseButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.backgroundColor = UIColor(named: "Color")
        button.layer.cornerRadius = 17
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        return button
    }()
    
    let trueFalseStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupStackViews()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(scoreLabel)
        addSubview(questionLabel)
        addSubview(progressView)
        addSubview(trueFalseStackView)
        addSubview(footerImageView)
        
        trueButton.setImage(UIImage(named: "Rectangle"), for: .normal)
        falseButton.setImage(UIImage(named: "Rectangle"), for: .normal)
        trueButton.setTitle("True", for: .normal)
        falseButton.setTitle("False", for: .normal)
        
        trueButton.addTarget(self, action: #selector(answerButtonPressed(_:)), for: .touchUpInside)
        falseButton.addTarget(self, action: #selector(answerButtonPressed(_:)), for: .touchUpInside)
    }
    
    private func setupStackViews() {
        trueFalseStackView.addArrangedSubview(createButtonWithLabel(button: trueButton, text: "True"))
        trueFalseStackView.addArrangedSubview(createButtonWithLabel(button: falseButton, text: "False"))
    }
    
    private func createButtonWithLabel(button: UIButton, text: String) -> UIView {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false

        let label = UILabel()
        label.text = text
        label.textColor = .white
        label.font = .systemFont(ofSize: 26)
        label.translatesAutoresizingMaskIntoConstraints = false

        container.addSubview(button)
        container.addSubview(label)

        trueFalseStackView.addArrangedSubview(container)

        NSLayoutConstraint.activate([
            container.heightAnchor.constraint(equalToConstant: 70),
            label.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            button.topAnchor.constraint(equalTo: container.topAnchor),
            button.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 35),
            button.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -35)
        ])

        return container
    }
    
    @objc func answerButtonPressed(_ sender: UIButton) {
        delegate?.answerButtonPressed(sender)
    }
}

