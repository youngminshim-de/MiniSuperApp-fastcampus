//
//  AdaptivePresentationControllerDelegate.swift
//  MiniSuperApp
//
//  Created by 심영민 on 2023/06/07.
//

import UIKit

public protocol AdaptivePresentationControllerDelegate: AnyObject {
    func presentationControllerDidDismiss()
}

public final class AdaptivePresentationControllerDelegateProxy: NSObject, UIAdaptivePresentationControllerDelegate {
    public weak var delegate: AdaptivePresentationControllerDelegate?
    public func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        delegate?.presentationControllerDidDismiss()
    }
}
