//
//  AddPaymentMethodViewController.swift
//  MiniSuperApp
//
//  Created by 심영민 on 2023/06/07.
//

import ModernRIBs
import UIKit

protocol AddPaymentMethodPresentableListener: AnyObject {
    func didTapClose()
    func didTapConfirm(with number: String, cvc: String, expiration: String)
}

final class AddPaymentMethodViewController: UIViewController, AddPaymentMethodPresentable, AddPaymentMethodViewControllable {

    weak var listener: AddPaymentMethodPresentableListener?
    
    private let carNumberTextFiled: UITextField = {
        let textField = makeTextField()
        textField.placeholder = "카드 번호"
        return textField
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 14
        return stackView
    }()
    
    private let securityTextField: UITextField = {
        let textField = makeTextField()
        textField.placeholder = "CVC"
        return textField
    }()
    
    private let expirationTextField: UITextField = {
        let textField = makeTextField()
        textField.placeholder = "유효기간"
        return textField
    }()
    
    private lazy var addCardButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.roundCorners()
        button.backgroundColor = .primaryRed
        button.setTitle("추가하기", for: .normal)
        button.addTarget(self, action: #selector(didTapAddCard), for: .touchUpInside)
        return button
    }()
    
    private static func makeTextField() -> UITextField {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        return textField
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        title = "카드 추가"
        
        setupNavigationItem(with: .close, target: self, action: #selector(didTapClose))
        
        view.backgroundColor = .backgroundColor
        view.addSubview(carNumberTextFiled)
        view.addSubview(stackView)
        view.addSubview(addCardButton)
        
        stackView.addArrangedSubview(securityTextField)
        stackView.addArrangedSubview(expirationTextField)
        
        NSLayoutConstraint.activate([
            carNumberTextFiled.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            carNumberTextFiled.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            carNumberTextFiled.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            carNumberTextFiled.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            stackView.bottomAnchor.constraint(equalTo: addCardButton.topAnchor, constant: -20),
            addCardButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            addCardButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            carNumberTextFiled.heightAnchor.constraint(equalToConstant: 60),
            securityTextField.heightAnchor.constraint(equalToConstant: 60),
            expirationTextField.heightAnchor.constraint(equalToConstant: 60),
            addCardButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    @objc
    func didTapAddCard() {
        if let number = carNumberTextFiled.text,
           let cvc = securityTextField.text,
           let expiry = expirationTextField.text {
            listener?.didTapConfirm(with: number, cvc: cvc, expiration: expiry)
        }
    }
    
    @objc
    private func didTapClose() {
        listener?.didTapClose()
    }
}
