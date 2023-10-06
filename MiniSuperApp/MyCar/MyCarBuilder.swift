//
//  MyCarBuilder.swift
//  MiniSuperApp
//
//  Created by 심영민 on 2023/06/28.
//

import ModernRIBs

protocol MyCarDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class MyCarComponent: Component<MyCarDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol MyCarBuildable: Buildable {
    func build(withListener listener: MyCarListener) -> MyCarRouting
}

final class MyCarBuilder: Builder<MyCarDependency>, MyCarBuildable {

    override init(dependency: MyCarDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: MyCarListener) -> MyCarRouting {
        let component = MyCarComponent(dependency: dependency)
        let viewController = MyCarViewController()
        let interactor = MyCarInteractor(presenter: viewController)
        interactor.listener = listener
        return MyCarRouter(interactor: interactor, viewController: viewController)
    }
}
