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
    func getInformation() {
        interactor?.getBrastlewark()
    }
    
}
extension HomePresenter: HomeInteractorOutputProtocol {
}
