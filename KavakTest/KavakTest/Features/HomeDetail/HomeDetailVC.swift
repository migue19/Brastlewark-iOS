//
//  HomeDetailVC.swift
//  KavakTest
//
//  Created by Miguel Mexicano Herrera on 19/06/21.
//

import UIKit

class HomeDetailVC: UIViewController {
    @IBOutlet weak var imageView: ImageLoader!
    var presenter: HomeDetailPresenterProtocol?
    var data: citizensBrastlewark?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDetail()
    }
    func setupDetail() {
        guard let data = data else {
            return
        }
        imageView.downloadImageFrom(url: data.thumbnail, imageMode: .scaleAspectFill)
    }
}
extension HomeDetailVC: HomeDetailViewProtocol {
}
