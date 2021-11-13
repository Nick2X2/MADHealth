//
//  HomeCardTableViewCell.swift
//  MADHealth
//
//  Created by Mikita Poluektau on 13.11.21.
//

import UIKit

class HomeCardTableViewCell: UITableViewCell {
    
    // - UI
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    func set(card: HomeCard) {
        titleLabel.text = card.title
        iconImageView.image = card.image
    }

}
