//
//  HomeInteractor.swift
//  KavakTest
//
//  Created by Miguel Mexicano Herrera on 19/06/21.
//  
//
import ConnectionLayer
class HomeInteractor {
    var presenter: HomeInteractorOutputProtocol?
    var connectionLayer = ConnectionLayer()
    
}
extension HomeInteractor: HomeInteractorInputProtocol {
    func getBrastlewark() {
        connectionLayer.conneccionRequest(url: KavakURL.brastlewark, method: .get, headers: [:], parameters: nil) { (data, error) in
            guard let data = data else {
                return
            }
            let decoder = JSONDecoder()
            do {
                let city = try decoder.decode(BrastlewarkCity.self, from: data)
                print(city)
            } catch {
                print(error)
            }
        }
    }
}
