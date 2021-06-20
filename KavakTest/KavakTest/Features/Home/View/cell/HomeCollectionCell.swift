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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setupCell(data: citizensBrastlewark) {
        backgroundColor = .red
        nameLabel.text = data.name
        imageView.downloadImageFrom(url: data.thumbnail, imageMode: .scaleAspectFill)
    }
}
