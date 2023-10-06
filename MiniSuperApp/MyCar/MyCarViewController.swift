//
//  MyCarViewController.swift
//  MiniSuperApp
//
//  Created by 심영민 on 2023/06/28.
//

import ModernRIBs
import UIKit

protocol MyCarPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class MyCarViewController: UIViewController, MyCarPresentable, MyCarViewControllable {

    weak var listener: MyCarPresentableListener?
}
