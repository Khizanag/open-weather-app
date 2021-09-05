//
//  ForecastViewController.swift
//  Leavingstone-weather-app
//
//  Created by Giga Khizanishvili on 31.08.21.
//

import UIKit

class ForecastViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    private var model = Model()
    private let service = Service()
    private let errorView = ErrorView()
    private let loader = LoaderComponentView()
    
    // MARK: - Lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        refresh(self)
    }
    
    // MARK: - Setup
    
    private func setup() {
        setupTableView()
        setupErrorView()
        setupLoader()
    }

    private func setupTableView() {
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        setupTableViewRegistrations()
    }

    private func setupTableViewRegistrations() {
        tableView.register(
            UINib(nibName: ForecastTableViewCell.identifier, bundle: nil),
            forCellReuseIdentifier: ForecastTableViewCell.identifier)
        tableView.register(
            UINib(nibName: ForecastTableHeaderView.identifier, bundle: nil),
            forHeaderFooterViewReuseIdentifier: ForecastTableHeaderView.identifier)
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

    @IBAction func refresh(_ sender: Any) {
        errorView.hide()
        loader.startLoading()
        
        guard Connectivity.isConnectedToInternet else { refreshFailed(with: .noInternet); return }
        guard let location = UserDefaultsManager.getCurrentLocation() else {refreshFailed(with: .noLocationAuthorized); return }
        
        service.requestForecastWeatherData(location: location) {  [weak self] result in
            DispatchQueue.main.async { // TODO: try without dispatchQueue
                guard let self = self else { return }
                switch result {
                case .success(let response): self.refreshSuccessed(with: response)
                case .failure(_): self.refreshFailed(with: .noInformationLoaded)
                }
            }
        }
    }
    
    private func refreshSuccessed(with model: Model) {
        self.model = model
        tableView.reloadData()
        loader.stopLoading()
    }

    private func refreshFailed(with error: ErrorView.ErrorType) {
        print("-- ForecastViewController.refresh.service.requestForecast failed with: \(String(describing: error))")
        loader.stopLoading()
        errorView.type = error
        errorView.show()
    }

}

extension ForecastViewController: UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        model.sectionModels.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.sectionModels[section].rowModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ForecastTableViewCell.identifier, for: indexPath)
        if let forecastTableCell = cell as? ForecastTableViewCell {
            let viewModel = model.sectionModels[indexPath.section].rowModels[indexPath.row]
            forecastTableCell.configure(with: viewModel)
            return forecastTableCell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: ForecastTableHeaderView.identifier)
        if let forecastHeader = header as? ForecastTableHeaderView {
            forecastHeader.configure(with: model.sectionModels[section].headerModel)
            return forecastHeader
        }
        return nil
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat { 44 }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 72 }

}

extension ForecastViewController: UITableViewDataSource {}

extension ForecastViewController: ErrorViewDelegate {

    func reloadTapped() {
        refresh(self)
    }

}
