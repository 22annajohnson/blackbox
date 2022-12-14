//
//  ViewController.swift
//  BlackBox
//
//  Created by Anna Johnson on 11/8/22.
//

import UIKit
import SwiftUI

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: VitalsViewController())
        let vc3 = UINavigationController(rootViewController: EnvironmentViewController())
        let vc4 = UINavigationController(rootViewController: TeamViewController())

        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "stethoscope")
        vc3.tabBarItem.image = UIImage(systemName: "airplane")
        vc4.tabBarItem.image = UIImage(systemName: "person.2.fill")
        
        
        vc1.title = "Hanger"
        vc2.title = "Vitals"
        vc3.title = "Environment"
        vc4.title = "Crew"
        
        
        tabBar.tintColor = UIColor(red: 0/255, green: 85/255, blue: 187/255, alpha: 1)
        tabBar.backgroundColor = .white
        tabBar.barTintColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1)

        
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
        
    }

}

