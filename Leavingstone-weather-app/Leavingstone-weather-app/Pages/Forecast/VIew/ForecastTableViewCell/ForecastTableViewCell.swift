//
//  ForecastTableViewCell.swift
//  Weather App
//
//  Created by Giga Khizanishvili on 25.01.21.
//

import UIKit
import SDWebImage

class ForecastTableViewCell: UITableViewCell {

	static let identifier = "ForecastTableViewCell"

	@IBOutlet weak var iconView: UIImageView!
	@IBOutlet weak var timeLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var temperatureLabel: UILabel!

	private var model: ForecastItemModel?

	public func configure(with model: ForecastItemModel) {
        self.model = model

        iconView.sd_setImage(
            with: URL(string: IconPathFactory.build(for: model.iconName)),
            placeholderImage: R.image.sun()!)
        timeLabel.text = model.hour
		descriptionLabel.text = model.description
		temperatureLabel.text = model.temperature
	}
}
