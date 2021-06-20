//
//  HeaderCollectionView.swift
//  KavakTest
//
//  Created by Miguel Mexicano Herrera on 20/06/21.
//

import UIKit

class HeaderCollectionView: UICollectionReusableView {
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setupCell(title: String) {
        titleLabel.text = title
    }
}
