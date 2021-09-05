//
//  ErrorView.swift
//  Leavingstone-weather-app
//
//  Created by Giga Khizanishvili on 31.08.21.
//

import UIKit

protocol ErrorViewDelegate: AnyObject {
    func reloadTapped()
}

class ErrorView: BaseReusableView {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var reloadButton: UIButton!
    
    public weak var delegate: ErrorViewDelegate?
    public var type: ErrorType  = .defaultError {
        didSet {
            configure(with: .init(description: type.description))
        }
    }

    // MARK: - Lifecycle methods
    override func layoutSubviews() {
        super.layoutSubviews()
        reloadButton.roundCorners(radius: 12)
    }
    
    // MARK: - Configure
    public func configure(with model: Model) {
        descriptionLabel.text = model.description
    }

    @IBAction func reloadHandler(_ sender: Any) {
        delegate?.reloadTapped()
    }
}

extension ErrorView {
    struct Model {
        var description: String
    }
}

extension ErrorView {
    enum ErrorType {
        case defaultError
        case noLocationAuthorized
        case noInternet
        case noInformationLoaded
        
        var description: String {
            switch self {
            case .defaultError:
                return R.string.localization.error_message_default_error()
            case .noInternet:
                return R.string.localization.error_message_no_internet()
            case .noInformationLoaded:
                return R.string.localization.error_message_no_information_loaded()
            case .noLocationAuthorized:
                return R.string.localization.error_message_no_location_authorized()
            }
        }
    }
}
