//
//  InformationCell.swift
//  KavakTest
//
//  Created by Miguel Mexicano Herrera on 20/06/21.
//

import UIKit

class InformationCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setupCell(data: InformationDataCell) {
        titleLabel.text = data.title
        descriptionLabel.text = data.description
    }
    
}
