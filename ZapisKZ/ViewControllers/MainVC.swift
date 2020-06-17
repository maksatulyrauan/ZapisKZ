//
//  MainVC.swift
//  ZapisKZ
//
//  Created by Rauan on 5/12/20.
//  Copyright © 2020 Rauan. All rights reserved.
//

import UIKit

class MainVC: UITabBarController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        
        let catalogueVC = CatalogueVC()
                
        catalogueVC.tabBarItem.image = #imageLiteral(resourceName: "house")
        catalogueVC.tabBarItem.title = "Главная"


        let tabBarList = [catalogueVC]

        viewControllers = tabBarList
    }
    
    private func setupBackground() {
        getSafeAreaFrame()
        tabBar.barTintColor = .white
    }
}

