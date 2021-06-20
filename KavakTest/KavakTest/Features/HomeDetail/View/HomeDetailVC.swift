//
//  HomeDetailVC.swift
//  KavakTest
//
//  Created by Miguel Mexicano Herrera on 19/06/21.
//

import UIKit

class HomeDetailVC: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var imageView: ImageLoader!
    var presenter: HomeDetailPresenterProtocol?
    var data: citizensBrastlewark?
    var dataSource: [InformationDataCell] = [InformationDataCell]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDetail()
    }
    func setupDetail() {
        guard let data = data else {
            return
        }
        imageView.downloadImageFrom(url: data.thumbnail, imageMode: .scaleAspectFill)
        dataSource = InformationData(data: data).generateDataSource()
        setupTableView()
        nameLabel.text = data.name
        ageLabel.text = "(\(data.age) Años)"
    }
    func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName: "InformationCell", bundle: Bundle.main), forCellReuseIdentifier: "InformationCell")
    }
}
extension HomeDetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "InformationCell") as? InformationCell else {
            return UITableViewCell()
        }
        cell.setupCell(data: dataSource[indexPath.row])
        return cell
    }
}
extension HomeDetailVC: HomeDetailViewProtocol {
}
