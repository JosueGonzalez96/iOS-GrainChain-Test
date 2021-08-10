//
//  ContentTabBar.swift
//  iOS GrainChain Test
//
//  Created by Alberto Josue Gonzalez Juarez on 10/08/21.
//  Copyright © 2021 Alberto Josue Gonzalez Juarez. All rights reserved.
//

import Foundation
import UIKit

class ContentTabBar: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setAppearance()
        let mapController = MapTourController()
        
        let navigationController = UINavigationController(rootViewController: mapController)
        let navigationTourController = UINavigationController(rootViewController: ToursController())
        navigationController.tabBarItem = UITabBarItem(title: "Mapa", image: nil, selectedImage: nil)
        navigationTourController.tabBarItem = UITabBarItem(title: "Recorridos", image: nil, selectedImage: nil)
        
        viewControllers = [navigationController, navigationTourController]
    }
    
    func setAppearance() {
        UINavigationBar.appearance().backgroundColor = .systemGreen
        UINavigationBar.appearance().barTintColor = .systemGreen
        UITabBar.appearance().barTintColor = .white
    }
}
