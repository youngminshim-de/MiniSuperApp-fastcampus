//
//  PaymentMethodView.swift
//  MiniSuperApp
//
//  Created by 심영민 on 2023/06/05.
//

import UIKit

final class PaymentMethodView: UIView {
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .white
        label.text = "우리은행"
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = .white
        label.text = "**** 9999"
        return label
    }()
    
    init(viewMdodel: PaymentMethodViewModel) {
        super.init(frame: .zero)
        setupViews()
        
        nameLabel.text = viewMdodel.name
        subTitleLabel.text = viewMdodel.digits
        self.backgroundColor = viewMdodel.color
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        addSubview(nameLabel)
        addSubview(subTitleLabel)
        backgroundColor = .systemIndigo
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            subTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            subTitleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
