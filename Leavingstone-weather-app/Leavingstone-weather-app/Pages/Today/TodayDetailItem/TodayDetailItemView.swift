//
//  TodayDetailItemView.swift
//  Leavingstone-weather-app
//
//  Created by Giga Khizanishvili on 31.08.21.
//

import UIKit

class TodayDetailItemView: BaseReusableView {
    
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    public func configure(with model: Model) {
        iconView.image = model.icon
        descriptionLabel.text = model.description
    }
}

extension TodayDetailItemView {
    struct Model {
        var icon: UIImage
        var description: String
        
        init(icon: UIImage, description: String) {
            self.icon = icon
            self.description = description
        }
    }
}
