//
//  ToursViewModel.swift
//  iOS GrainChain Test
//
//  Created by Alberto Josue Gonzalez Juarez on 10/08/21.
//  Copyright © 2021 Alberto Josue Gonzalez Juarez. All rights reserved.
//

import Foundation

class ToursViewModel {
    private var arrayTours: [Tour] = []
    var successFecth: (() -> Void)?
    func fetch() {
        DatabaseManager().getTours { [weak self] (result) in
            switch result {
            case .success(let tours):
                self?.arrayTours = tours
                self?.successFecth?()
            case .failure(let err):
                debugPrint(err)
            }
        }
    }
    func getNumberOfRows() -> Int {
        return arrayTours.count
    }
    func getTourForRow(indexPath: IndexPath) -> Tour {
        return arrayTours[indexPath.row]
    }
}
