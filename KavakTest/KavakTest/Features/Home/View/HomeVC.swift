//
//  HomeVC.swift
//  KavakTest
//
//  Created by Miguel Mexicano Herrera on 19/06/21.
//

import UIKit

class HomeVC: UIViewController {
    var presenter: HomePresenterProtocol?
    var dataSource: [citizensBrastlewark] = [citizensBrastlewark]()
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    func getData() {
        presenter?.getInformation()
    }
    func setupCollectionView() {
        let nib = UINib(nibName: "HomeCollectionCell", bundle: nil)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(nib, forCellWithReuseIdentifier: "HomeCollectionCell")
        getData()
    }
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        collectionView.reloadData()
    }
}
extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalespace: CGFloat = 16 * 3
        let width = UIScreen.main.bounds.width - totalespace
        return CGSize(width: width/2, height: self.view.bounds.width/2)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}
extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionCell", for: indexPath) as? HomeCollectionCell else { return UICollectionViewCell() }
        cell.setupCell(data: dataSource[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.pressDetail(data: dataSource[indexPath.row])
    }
}
/// Protocolo para recibir datos de presenter.
extension HomeVC: HomeViewProtocol {
    func showData(data: [citizensBrastlewark]) {
        dataSource = data
        collectionView.reloadData()
    }
}
