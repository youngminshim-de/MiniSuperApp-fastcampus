//
//  PaymentMethod.swift
//  MiniSuperApp
//
//  Created by 심영민 on 2023/06/05.
//

import Foundation

struct PaymentMethod: Decodable {
    let id: String
    let name: String
    let digits: String
    let color: String
    let isPrimary: Bool
}
