//
//  Utils.swift
//  iOS GrainChain Test
//
//  Created by Alberto Josue Gonzalez Juarez on 07/08/21.
//  Copyright © 2021 Alberto Josue Gonzalez Juarez. All rights reserved.
//

import Foundation

extension Date {
    func getFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: self)
    }
}
