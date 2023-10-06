//
//  File.swift
//  
//
//  Created by 심영민 on 2023/10/05.
//

import Foundation

extension Array {
  subscript(safe index: Int) -> Element? {
    return indices ~= index ? self[index] : nil
  }
}


