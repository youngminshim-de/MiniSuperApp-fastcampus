//
//  Formatter.swift
//  MiniSuperApp
//
//  Created by 심영민 on 2023/10/05.
//

import Foundation

struct Formatter {
    static let balanceFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
}
