//
//  SensorViewController.swift
//  BlackBox
//
//  Created by Anna Johnson on 11/9/22.
//

import UIKit
import SwiftUI


class SensorViewController: UIViewController {
    


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        addTitle()
   

    }
    
    func addTitle() {
        let sensorLabel = UILabel()
        sensorLabel.text = "Breathing Rate"
        sensorLabel.textColor = .black
        sensorLabel.font = UIFont(name: "Inter-Regular_Bold", size: 28)
        sensorLabel.frame = CGRect(x: 30, y: 20, width: view.bounds.width-60, height: 50)
        
        view.addSubview(sensorLabel)
    }
  
    
    
    
}
