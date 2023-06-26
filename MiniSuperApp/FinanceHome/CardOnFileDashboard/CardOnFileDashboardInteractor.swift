//
//  CardOnFileDashboardInteractor.swift
//  MiniSuperApp
//
//  Created by 심영민 on 2023/06/05.
//

import Combine
import ModernRIBs

protocol CardOnFileDashboardRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol CardOnFileDashboardPresentable: Presentable {
    var listener: CardOnFileDashboardPresentableListener? { get set }
    
    func update(_ viewModels: [PaymentMethodViewModel])
}

protocol CardOnFileDashboardListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
    func cardsOnFileDashboardDidTapAddPaymentMethod()
}

protocol CardOnFileDashboardInteractorDependency {
    var cardsOnFileRepository: CardOnFileRepository { get }
}

final class CardOnFileDashboardInteractor: PresentableInteractor<CardOnFileDashboardPresentable>, CardOnFileDashboardInteractable, CardOnFileDashboardPresentableListener {

    weak var router: CardOnFileDashboardRouting?
    weak var listener: CardOnFileDashboardListener?

    private let dependency: CardOnFileDashboardInteractorDependency
    
    private var cancellable: Set<AnyCancellable>
    // in constructor.
    init(
        presenter: CardOnFileDashboardPresentable,
        dependency: CardOnFileDashboardInteractorDependency) {
            self.dependency = dependency
            self.cancellable = .init()
            super.init(presenter: presenter)
            presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        
        dependency.cardsOnFileRepository.cardOnFile.sink { [weak self] methods in
            let viewModels = methods.prefix(5).map { PaymentMethodViewModel($0) }
            self?.presenter.update(viewModels)
        }
        .store(in: &cancellable)
    }

    override func willResignActive() {
        super.willResignActive()
        
        cancellable.forEach { $0.cancel() }
        cancellable.removeAll()
    }
    
    func didTapAddPaymentMethod() {
        listener?.cardsOnFileDashboardDidTapAddPaymentMethod()
    }
}
