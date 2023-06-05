//
//  CardOnFileRepository.swift
//  MiniSuperApp
//
//  Created by 심영민 on 2023/06/05.
//

import Foundation

protocol CardOnFileRepository {
    var cardOnFile: ReadOnlyCurrentValuePublisher<[PaymentMethod]> { get }
}

final class CardonFileRepositoryImp: CardOnFileRepository {
    var cardOnFile: ReadOnlyCurrentValuePublisher<[PaymentMethod]> { paymentMethodSubject }
    
    private let paymentMethodSubject = CurrentValuePublisher<[PaymentMethod]>([
        PaymentMethod(id: "0", name: "우리은행", digits: "0123", color: "#f19a38ff", isPrimary: false),
        PaymentMethod(id: "1", name: "신한카드", digits: "0111", color: "#3478f6ff", isPrimary: false),
        PaymentMethod(id: "2", name: "현대카드", digits: "5739", color: "#78c5f5ff", isPrimary: false),
        PaymentMethod(id: "3", name: "우리은행", digits: "1923", color: "#65c466ff", isPrimary: false),
        PaymentMethod(id: "4", name: "우리은행", digits: "8562", color: "#ffcc00ff", isPrimary: false)
        ])
}
