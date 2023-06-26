//
//  UIViewController+Utils.swift
//  MiniSuperApp
//
//  Created by 심영민 on 2023/06/26.
//

import UIKit

enum DismissButtonType {
    case back, close
    
    var iconSystemName: String {
        switch self {
        case .back:
            return "chevron.backward"
        case .close:
            return "xmark"
        }
    }
}

extension UIViewController {
    func setupNavigationItem(with buttonType: DismissButtonType, target: Any?, action: Selector?) {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: buttonType.iconSystemName, withConfiguration: UIImage.SymbolConfiguration(pointSize: 18, weight:  .semibold)),
            style: .plain,
            target: target,
            action: action)
    }
}