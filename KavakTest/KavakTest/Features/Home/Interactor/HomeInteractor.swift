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
                let brastlewarkCity = try decoder.decode(BrastlewarkCity.self, from: data)
                self.receiveData(entity: brastlewarkCity)
            } catch {
                self.receiveError(message: error.localizedDescription)
            }
        }
    }
    func receiveData(entity: BrastlewarkCity) {
        DispatchQueue.main.async {
            self.presenter?.sendData(data: entity.brastlewark)
        }
    }
    func receiveError(message: String) {
        DispatchQueue.main.async {
            print(message)
        }
    }
}
