//
//  HomeDetailPresenter.swift
//  KavakTest
//
//  Created by Miguel Mexicano Herrera on 19/06/21.
//  
//

import Foundation

class HomeDetailPresenter {
    
    var view: HomeDetailViewProtocol?
    var interactor: HomeDetailInteractorInputProtocol?
    var router: HomeDetailRouterProtocol?
    
}
extension HomeDetailPresenter: HomeDetailPresenterProtocol {
}
extension HomeDetailPresenter: HomeDetailInteractorOutputProtocol {
}
