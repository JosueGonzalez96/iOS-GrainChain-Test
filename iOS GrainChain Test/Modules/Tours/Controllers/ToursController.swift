//
//  ToursController.swift
//  iOS GrainChain Test
//
//  Created by Alberto Josue Gonzalez Juarez on 07/08/21.
//  Copyright © 2021 Alberto Josue Gonzalez Juarez. All rights reserved.
//

import UIKit

class ToursController: UIViewController {
    let tableViewTours: UITableView = UITableView()
    var viewModel: ToursViewModel = ToursViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModelSetup()
        setTableView()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetch()
    }

    func setTableView() {
        
        view.addSubview(tableViewTours)
        tableViewTours.translatesAutoresizingMaskIntoConstraints = false
        tableViewTours.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableViewTours.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        tableViewTours.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        tableViewTours.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
        tableViewTours.delegate = self
        tableViewTours.dataSource = self
        tableViewTours.register(TourCell.self, forCellReuseIdentifier: "TourCell")
    }
    private func viewModelSetup() {
        viewModel.successFecth = {[weak self] () in
            DispatchQueue.main.async {
                self?.tableViewTours.reloadData()
            }
        }
    }
}
extension ToursController: TourDetailControllerDelegate {
    func reload() {
        viewModel.fetch()
    }
}
extension ToursController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = TourDetailController()
        let tour = viewModel.getTourForRow(indexPath: indexPath)
        let viewModel = TourDetailViewModel(tourModel: tour)
        vc.viewModel = viewModel
        vc.delegate = self
        let nav = UINavigationController(rootViewController: vc)
        present(nav, animated: true, completion: nil)
    }
}

extension ToursController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let getNumberOfRows = viewModel.getNumberOfRows()
        if getNumberOfRows != 0 {
            return getNumberOfRows
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let numberOfRows = viewModel.getNumberOfRows()
        if numberOfRows != 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TourCell") as? TourCell
            let tour = viewModel.getTourForRow(indexPath: indexPath)
            cell?.setupCell(tour: tour)
            return cell ?? UITableViewCell()
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "emptyCell") ?? UITableViewCell()
            cell.textLabel?.text = "Sin Recorridos"
            cell.textLabel?.textAlignment = .center
            return cell
        }
       
    }
}


