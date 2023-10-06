//
//  MyCarRouter.swift
//  MiniSuperApp
//
//  Created by 심영민 on 2023/06/28.
//

import ModernRIBs

protocol MyCarInteractable: Interactable {
    var router: MyCarRouting? { get set }
    var listener: MyCarListener? { get set }
}

protocol MyCarViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class MyCarRouter: ViewableRouter<MyCarInteractable, MyCarViewControllable>, MyCarRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: MyCarInteractable, viewController: MyCarViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
