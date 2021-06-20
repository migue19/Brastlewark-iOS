//
//  HomeCollectionCell.swift
//  KavakTest
//
//  Created by Miguel Mexicano Herrera on 19/06/21.
//

import UIKit

class HomeCollectionCell: UICollectionViewCell {
    @IBOutlet weak var imageView: ImageLoader!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    var dataSource: [String] = [String]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setupCell(data: citizensBrastlewark) {
        elevate(elevation: 15)
//        layer.borderWidth = 1
//        layer.cornerRadius = 15
//        layer.borderColor = UIColor.white.cgColor
        dataSource = data.friends
        setupCollectionView()
        nameLabel.text = data.name
        imageView.downloadImageFrom(url: data.thumbnail, imageMode: .scaleAspectFill)
    }
    func setupCollectionView() {
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        let nib = UINib(nibName: "HomeFriendCollectionCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "HomeFriendCollectionCell")
    }
}
extension HomeCollectionCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalespace: CGFloat = 8 * 3
        let width = bounds.width - totalespace
        return CGSize(width: width/2-1, height: 28)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
}
extension HomeCollectionCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeFriendCollectionCell", for: indexPath) as? HomeFriendCollectionCell else { return UICollectionViewCell() }
        cell.setupCell(data: dataSource[indexPath.row])
        return cell
    }
}
