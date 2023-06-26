//
//  AdaptivePresentationControllerDelegate.swift
//  MiniSuperApp
//
//  Created by 심영민 on 2023/06/07.
//

import UIKit

protocol AdaptivePresentationControllerDelegate: AnyObject {
    func presentationControllerDidDismiss()
}

final class AdaptivePresentationControllerDelegateProxy: NSObject, UIAdaptivePresentationControllerDelegate {
    weak var delegate: AdaptivePresentationControllerDelegate?
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        delegate?.presentationControllerDidDismiss()
    }
}
