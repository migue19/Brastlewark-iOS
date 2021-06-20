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
    var friends: [String] = [String]()
    var professions: [String] = [String]()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
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
        friends = data.friends
        professions = data.professions
        setupCollectionView()
        nameLabel.text = data.name
        ageLabel.text = "(\(data.age) Años)"
    }
    func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName: "InformationCell", bundle: Bundle.main), forCellReuseIdentifier: "InformationCell")
    }
    func setupCollectionView() {
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        let nib = UINib(nibName: "HomeFriendCollectionCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "HomeFriendCollectionCell")
        collectionView.register(UINib(nibName: "HeaderCollectionView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCollectionView")
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
extension HomeDetailVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalespace: CGFloat = 8 * 3
        let width = self.view.bounds.width - totalespace
        return CGSize(width: width/2-1, height: 28)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
}
extension HomeDetailVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCollectionView", for: indexPath) as? HeaderCollectionView else {
            return UICollectionReusableView()
        }
        let title = indexPath.section == 0 ? "Amigos" : "Profesiones"
        header.setupCell(title: title)
        return header
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? friends.count : professions.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeFriendCollectionCell", for: indexPath) as? HomeFriendCollectionCell else { return UICollectionViewCell() }
        let seccion = indexPath.section
        let data = seccion == 0 ? friends[indexPath.row] : professions[indexPath.row]
        cell.setupCell(data: data)
        return cell
    }
}
extension HomeDetailVC: HomeDetailViewProtocol {
}
