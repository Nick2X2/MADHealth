//
//  HistoryCardTableViewCell.swift
//  MADHealth
//
//  Created by Mikita Poluektau on 13.11.21.
//

import UIKit

class HistoryCardTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    func set(history: History) {
        if history.createTime.date?.fullDate == Date().fullDate {
            titleLabel.text = "Сегодня"
        } else if history.createTime.date?.fullDate == Date.yesterday.fullDate {
            titleLabel.text = "Вчера"
        } else if history.createTime.date?.fullDate == Date.tomorrow.fullDate {
            titleLabel.text = "Завтра"
        } else {
            titleLabel.text = history.createTime.date?.date
        }
        descriptionLabel.text = history.descriptionText
    }
}

// MARK: - Configure
private extension HistoryCardTableViewCell {
    
    func configure() {
        contentView.layer.masksToBounds = false
        layer.masksToBounds = false
    }
    
}
