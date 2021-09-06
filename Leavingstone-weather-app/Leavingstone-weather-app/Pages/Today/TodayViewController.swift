//
//  TodayViewController.swift
//  Leavingstone-weather-app
//
//  Created by Giga Khizanishvili on 31.08.21.
//

import Rswift

class TodayViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var locationDescriptionLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    
    // Separators
    @IBOutlet weak var separator1: UILabel!
    @IBOutlet weak var separator2: UILabel!
    
    // Details
    @IBOutlet weak var humidityItem: TodayDetailItemView!
    @IBOutlet weak var cloudItem: TodayDetailItemView!
    @IBOutlet weak var pressureItem: TodayDetailItemView!
    @IBOutlet weak var windSpeedItem: TodayDetailItemView!
    @IBOutlet weak var windDirectionItem: TodayDetailItemView!
    
    // MARK: - Properties
    private let service = Service()
    private let errorView = ErrorView()
    private let loader = LoaderComponentView()
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        refresh()
    }
    
    // MARK: - Setup
    
    private func setup() {
        setupErrorView()
        setupLoader()
    }
    
    private func setupErrorView() {
        errorView.delegate = self
        errorView.hide()
        view.addSubview(errorView)
        errorView.frame = view.bounds
        view.bringSubviewToFront(errorView)
    }
    
    private func setupLoader() {
        view.addSubview(loader)
        loader.contentView.pin(to: view)
        view.bringSubviewToFront(loader)
    }
    
    private func refresh() {
        print("*** Today.refresh")
        errorView.hide()
        loader.startLoading()
        
        guard Connectivity.isConnectedToInternet else { refreshFailed(with: .noInternet); return }
        guard let location = UserDefaultsManager.getCurrentLocation() else { refreshFailed(with: .noLocationAuthorized); return }
        
        service.requestTodayWeatherData(location: location) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                switch result {
                case .success(let response): self.refreshSuccessed(with: response)
                case .failure(_): self.refreshFailed(with: .noInformationLoaded)
                }
            }
        }
    }
    
    private func refreshSuccessed(with model: Model) {
        configure(with: model)
        loader.stopLoading()
    }
    
    private func refreshFailed(with errorType: ErrorView.ErrorType) {
        print("-- TodayWeatherViewController.refresh.service.requestForecast failed with: \(String(describing: errorType))")
        loader.stopLoading()
        errorView.type = errorType
        errorView.show()
    }
    
    // MARK: - Configure
    
    public func configure(with model: Model) {
        configureIcon(with: model.iconName)
        configureLocationDescription(with: model.locationDescription)
        configureWeatherDescription(with: model.description)
        configureDetailItems(with: model)
    }
    
    private func configureIcon(with name: String) {
        iconView.sd_setImage(
            with: URL(string: IconPathFactory.build(for: name)),
            placeholderImage: R.image.sun()!)
    }
    
    private func configureLocationDescription(with locationDescription: String) {
        locationDescriptionLabel.text = locationDescription
    }
    
    private func configureWeatherDescription(with weatherDescription: String) {
        weatherDescriptionLabel.text = weatherDescription
    }
    
    private func configureDetailItems(with model: Model) {
        guard let details = model.details else { return }
        humidityItem.configure(with: .init(icon: details.humidity.icon, description: details.humidity.description))
        cloudItem.configure(with: .init(icon: details.cloud.icon, description: details.cloud.description))
        pressureItem.configure(with: .init(icon: details.pressure.icon, description: details.pressure.description))
        windSpeedItem.configure(with: .init(icon: details.windSpeed.icon, description: details.windSpeed.description))
        windDirectionItem.configure(with: .init(icon: details.windDirection.icon, description: details.windDirection.description))
    }
}

extension TodayViewController: ErrorViewDelegate {
    func reloadTapped() {
        refresh()
    }
}
