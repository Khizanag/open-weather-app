//
//  LoaderComponentView.swift
//  Leavingstone-weather-app
//
//  Created by Giga Khizanishvili on 05.09.21.
//

import UIKit

class LoaderComponentView: BaseReusableView {
    
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    public func startLoading() {
        contentView.show()
        loader.startAnimating()
    }
    
    public func stopLoading() {
        contentView.hide()
        loader.stopAnimating()
    }
}
