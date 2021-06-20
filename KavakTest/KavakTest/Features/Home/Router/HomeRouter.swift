//
//  HomeRouter.swift
//  KavakTest
//
//  Created by Miguel Mexicano Herrera on 19/06/21.
//  
//

import Foundation
import UIKit

class HomeRouter {
    var view: HomeVC
    private var presenter: HomePresenter
    private var interactor: HomeInteractor
    init() {
        self.view = HomeVC()
        self.presenter = HomePresenter()
        self.interactor = HomeInteractor()
        view.presenter = self.presenter
        presenter.view = self.view
        presenter.interactor = self.interactor
        presenter.router = self
        interactor.presenter = self.presenter
    }
}
extension HomeRouter: HomeRouterProtocol {
    func showDetail(data: citizensBrastlewark) {
        let detail = HomeDetailRouter(data: data)
        view.present(detail.view, animated: true, completion: nil)
    }
}

