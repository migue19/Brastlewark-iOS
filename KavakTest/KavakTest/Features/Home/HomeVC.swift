//
//  HomeVC.swift
//  KavakTest
//
//  Created by Miguel Mexicano Herrera on 19/06/21.
//

import UIKit

class HomeVC: UIViewController {
    var presenter: HomePresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
/// Protocolo para recibir datos de presenter.
extension HomeVC: HomeViewProtocol {
}
