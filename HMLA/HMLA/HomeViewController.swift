//
//  HomeViewController.swift
//  HMLA
//
//  Created by Sunxiaolin on 17/1/23.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//

import UIKit

class HomeViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let healthVC = HealthViewController()
        healthVC.title = "健康"
        let healthNav = UINavigationController(rootViewController: healthVC)
        healthNav.tabBarItem.image = UIImage(named: "health_selected")
        healthNav.tabBarItem.selectedImage = UIImage(named: "health_selected")
        
        let medicineVC = MedicineViewController()
        medicineVC.title = "医疗"
        let medicineNav = UINavigationController(rootViewController: medicineVC)
        medicineNav.tabBarItem.image = UIImage(named: "medicine_unselected")
        medicineNav.tabBarItem.selectedImage = UIImage(named: "medicine_selected")
        
        let lifeVC = LifeViewController()
        lifeVC.title = "生活"
        let lifeNav = UINavigationController(rootViewController: lifeVC)
        lifeNav.tabBarItem.image = UIImage(named: "life_selected")
        lifeNav.tabBarItem.selectedImage = UIImage(named: "life_selected")
        
        let agricultureVC = AgricultureViewController()
        agricultureVC.title = "农业"
        let agricultureNav = UINavigationController(rootViewController: agricultureVC)
        agricultureNav.tabBarItem.image = UIImage(named: "agriculture_unselected")
        agricultureNav.tabBarItem.selectedImage = UIImage(named: "agriculture_selected")
        
        let viewControllers = [healthNav, medicineNav, lifeNav, agricultureNav]
        self.viewControllers = viewControllers
        self.selectedIndex = 0;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
