//
//  HomeProtocol.swift
//  KavakTest
//
//  Created by Miguel Mexicano Herrera on 19/06/21.
//  
//

import Foundation
import UIKit
/// Protocolo que define los métodos y atributos para el view de Home
protocol HomeViewProtocol {
    // PRESENTER -> VIEW
    func showData(data: [citizensBrastlewark])
}
/// Protocolo que define los métodos y atributos para el routing de Home
protocol HomeRouterProtocol {
    // PRESENTER -> ROUTING
    func showDetail(data: citizensBrastlewark)
}
/// Protocolo que define los métodos y atributos para el Presenter de Home
protocol HomePresenterProtocol {
    // VIEW -> PRESENTER
    func getInformation()
    func pressDetail(data: citizensBrastlewark)
}
/// Protocolo que define los métodos y atributos para el Interactor de Home
protocol HomeInteractorInputProtocol {
    // PRESENTER -> INTERACTOR
    func getBrastlewark()
}
/// Protocolo que define los métodos y atributos para el Interactor de Home
protocol HomeInteractorOutputProtocol {
    // INTERACTOR -> PRESENTER
    func sendData(data: [citizensBrastlewark])
}

