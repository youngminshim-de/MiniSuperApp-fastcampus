//
//  CardOnFileRepository.swift
//  MiniSuperApp
//
//  Created by 심영민 on 2023/06/05.
//

import Foundation
import Combine

protocol CardOnFileRepository {
    var cardOnFile: ReadOnlyCurrentValuePublisher<[PaymentMethod]> { get }
    func addCard(info: AddPaymentMethodInformation) -> AnyPublisher<PaymentMethod, Error>
}

final class CardonFileRepositoryImp: CardOnFileRepository {
    var cardOnFile: ReadOnlyCurrentValuePublisher<[PaymentMethod]> { paymentMethodSubject }
    
    private let paymentMethodSubject = CurrentValuePublisher<[PaymentMethod]>([
        PaymentMethod(id: "3", name: "우리은행", digits: "1923", color: "#65c466ff", isPrimary: false),
//        PaymentMethod(id: "4", name: "우리은행", digits: "8562", color: "#ffcc00ff", isPrimary: false)
        ])
    
    func addCard(info: AddPaymentMethodInformation) -> AnyPublisher<PaymentMethod, Error> {
        let paymentMethod = PaymentMethod(id: "00",
                                          name: "New 카드",
                                          digits: "\(info.number.suffix(4))",
                                          color: "",
                                          isPrimary: false)
        
        var new = paymentMethodSubject.value
        new.append(paymentMethod)
        paymentMethodSubject.send(new)
        return Just(paymentMethod).setFailureType(to: Error.self).eraseToAnyPublisher()
    }
}
