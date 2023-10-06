//
//  MyCarInteractor.swift
//  MiniSuperApp
//
//  Created by 심영민 on 2023/06/28.
//

import ModernRIBs

protocol MyCarRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol MyCarPresentable: Presentable {
    var listener: MyCarPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol MyCarListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class MyCarInteractor: PresentableInteractor<MyCarPresentable>, MyCarInteractable, MyCarPresentableListener {

    weak var router: MyCarRouting?
    weak var listener: MyCarListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: MyCarPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}
