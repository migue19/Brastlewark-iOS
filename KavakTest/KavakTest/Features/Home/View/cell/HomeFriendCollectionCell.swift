//
//  HomeFriendCollectionCell.swift
//  KavakTest
//
//  Created by Miguel Mexicano Herrera on 19/06/21.
//

import UIKit

class HomeFriendCollectionCell: UICollectionViewCell {
    @IBOutlet weak var friendLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setupCell(data: String) {
        backgroundColor = .blue_color
        layer.cornerRadius = frame.size.height/2
        friendLabel.text = data
    }
}
