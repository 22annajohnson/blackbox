//
//  HomeViewController.swift
//  BlackBox
//
//  Created by Anna Johnson on 11/8/22.
//

import UIKit
import SwiftUI
import MapKit

class HomeViewController: UIViewController, MKMapViewDelegate {

    var health: [Sensor] = []
    var info: [SensorInfo] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
//        view.backgroundColor = UIColor(red: 243/255.0 , green: 244/255.0 , blue: 248/255.0,  alpha: 1)
        (health, info) = fetchData()
        addTitle()
        addProfileImage()
        addHealthAlerts()
        addFlightMap()
        
        
    }
    
    //Adds the title to the vire controller
    func addTitle() {
        let title = UILabel()
        title.font = UIFont(name: "Inter-Regular_Bold", size: 32)
        title.textColor = .black
        title.text = "Summary"
        title.frame = CGRect(x: 30, y: 60, width: view.bounds.width-60, height: 50)
        view.addSubview(title)
    }
    
    //Adds the Profile Image to the view controller
    func addProfileImage() {
        let image = UIImage(systemName: "person.circle.fill")
        let imageView = UIImageView(image: image)
        imageView.tintColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1)
        imageView.frame = CGRect(x: view.bounds.maxX-80, y: 60, width: 50, height: 50)
        
        view.addSubview(imageView)
        
    }
    
    //Adds the vitals/environmental table to the view controller
    func addHealthAlerts() {
        let title = UILabel()
        title.text = "Status"
        title.frame = CGRect(x: 30, y: view.bounds.height*0.15, width: view.bounds.width-60, height: 30)
        title.font = UIFont(name: "Inter-Regular_Bold", size: 20)
        title.textColor = .black
        
        let tableView = UITableView(frame: CGRect(x: 30, y: view.bounds.height*0.15+30, width: view.bounds.width-60, height: 300))
        setTableViewDelegates(tableView: tableView)
        tableView.backgroundColor = .clear
        //customizes the TableViewCell
        tableView.register(SensorTableViewCell.self, forCellReuseIdentifier: "cell")

        
        view.addSubview(tableView)
        view.addSubview(title)
    }
    
    //Sets the delegats for the table view
    func setTableViewDelegates(tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //Adds the map to the view controller
    func addFlightMap() {
        let title = UILabel()
        title.text = "My Flights"
        title.frame = CGRect(x: 30, y: view.bounds.height*0.5, width: view.bounds.width-60, height: 30)
        title.font = UIFont(name: "Inter-Regular_Bold", size: 20)
        title.textColor = .black
        
        let map = SummaryMapView(frame: CGRect(x: 30, y: view.bounds.height*0.55, width: view.bounds.width-60, height: 200))
        map.layer.cornerRadius = 10
        map.delegate = self
        
        view.addSubview(title)
        view.addSubview(map)
    }
  
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return health.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SensorTableViewCell
        let health = health[indexPath.section]
        
        //Sets the cells data
        cell.set(health: health)
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 10

        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1)
        backgroundView.layer.cornerRadius = 10
        cell.selectedBackgroundView = backgroundView
        
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return " "
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let navController = UINavigationController(rootViewController: SensorViewController())
        self.present(navController, animated: true, completion: nil)
    }
}

extension HomeViewController {
    
    func fetchData() -> ([Sensor], [SensorInfo]) {
        let health1 = Sensor(image: HealthImages.lungs!, title: "Breathing Rate")
        let health2 = Sensor(image: HealthImages.heart!, title: "Heart Rate")
        
        let info1 = SensorInfo(title: "Breathing Rate")
        let info2 = SensorInfo(title: "Heart Rate")

//        let health3 = Health(image: Images.stethoscope!, title: "Blood Oxygen")
//        let health4 = Health(image: Images.alert!, title: "Alertness")
//        let health5 = Health(image: Images.temp!, title: "Cabin Temp")
//        let health6 = Health(image: Images.carbon!, title: "Carbon Monoxide")
//
        return ([health1, health2], [info1, info2])
    }
}

