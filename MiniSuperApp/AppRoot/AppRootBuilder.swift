import ModernRIBs
import ProfileHome
import AppHome
import FinanceHome
import FinanceRepository
import UIKit

protocol AppRootDependency: Dependency {
  // TODO: Declare the set of dependencies required by this RIB, but cannot be
  // created by this RIB.
}

// MARK: - Builder

protocol AppRootBuildable: Buildable {
  func build() -> (launchRouter: LaunchRouting, urlHandler: URLHandler)
}

final class AppRootBuilder: Builder<AppRootDependency>, AppRootBuildable {
  
  override init(dependency: AppRootDependency) {
    super.init(dependency: dependency)
  }
  
  func build() -> (launchRouter: LaunchRouting, urlHandler: URLHandler) {
    let tabBar = RootTabBarController()
      
    let component = AppRootComponent(
        dependency: dependency,
        cardsOnFileRepository: CardonFileRepositoryImp(),
        superPayRepository: SuperPayRepositoryImp(),
        rootViewController: tabBar)
    
    let interactor = AppRootInteractor(presenter: tabBar)
    
    let appHome = AppHomeBuilder(dependency: component)
    let financeHome = FinanceHomeBuilder(dependency: component)
    let profileHome = ProfileHomeBuilder(dependency: component)
    let router = AppRootRouter(
      interactor: interactor,
      viewController: tabBar,
      appHome: appHome,
      financeHome: financeHome,
      profileHome: profileHome
    )
    
    return (router, interactor)
  }
}
