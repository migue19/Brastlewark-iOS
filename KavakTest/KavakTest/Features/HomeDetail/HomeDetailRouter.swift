//
//  HomeDetailRouter.swift
//  KavakTest
//
//  Created by Miguel Mexicano Herrera on 19/06/21.
//  
//

import Foundation
import UIKit

class HomeDetailRouter {
    var view: HomeDetailVC
    private var presenter: HomeDetailPresenter
    private var interactor: HomeDetailInteractor
    init() {
        self.view = HomeDetailVC()
        self.presenter = HomeDetailPresenter()
        self.interactor = HomeDetailInteractor()
        view.presenter = self.presenter
        presenter.view = self.view
        presenter.interactor = self.interactor
        presenter.router = self
        interactor.presenter = self.presenter
    }
    convenience init(data: citizensBrastlewark) {
        self.init()
        self.view.data = data
    }
}
extension HomeDetailRouter: HomeDetailRouterProtocol {
}

