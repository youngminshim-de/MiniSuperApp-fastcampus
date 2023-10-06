//
//  AddPaymentMethodInformation.swift
//  MiniSuperApp
//
//  Created by 심영민 on 2023/06/07.
//

import Foundation

public struct AddPaymentMethodInformation {
    public let number: String
    public let cvc: String
    public let expiration: String
    
    public init(number: String, cvc: String, expiration: String) {
        self.number = number
        self.cvc = cvc
        self.expiration = expiration
    }
}
