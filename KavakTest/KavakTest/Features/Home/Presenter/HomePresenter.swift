//
//  HomePresenter.swift
//  KavakTest
//
//  Created by Miguel Mexicano Herrera on 19/06/21.
//  
//

import Foundation

class HomePresenter {
    var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var router: HomeRouterProtocol?
}
extension HomePresenter: HomePresenterProtocol {
    func pressDetail(data: citizensBrastlewark) {
        router?.showDetail(data: data)
    }
    func getInformation() {
        interactor?.getBrastlewark()
    }
}
extension HomePresenter: HomeInteractorOutputProtocol {
    func sendData(data: [citizensBrastlewark]) {
        view?.showData(data: data)
    }
}
