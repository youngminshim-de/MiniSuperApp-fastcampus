//
//  CardOnFileRouter.swift
//  MiniSuperApp
//
//  Created by 심영민 on 2023/06/26.
//

import ModernRIBs

protocol CardOnFileInteractable: Interactable {
    var router: CardOnFileRouting? { get set }
    var listener: CardOnFileListener? { get set }
}

protocol CardOnFileViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class CardOnFileRouter: ViewableRouter<CardOnFileInteractable, CardOnFileViewControllable>, CardOnFileRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: CardOnFileInteractable, viewController: CardOnFileViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
