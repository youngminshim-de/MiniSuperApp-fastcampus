//
//  PaymentMethodViewModel.swift
//  MiniSuperApp
//
//  Created by 심영민 on 2023/06/05.
//

import UIKit

struct PaymentMethodViewModel {
    let name: String
    let digits: String
    let color: UIColor
    
    init(_ paymentMethod: PaymentMethod) {
        name = paymentMethod.name
        digits = "**** \(paymentMethod.digits)"
        color = UIColor(hex: paymentMethod.color) ?? .systemGray2
    }
}
