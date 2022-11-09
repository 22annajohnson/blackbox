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

    var health: [Health] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
//        view.backgroundColor = UIColor(red: 243/255.0 , green: 244/255.0 , blue: 248/255.0,  alpha: 1)
        health = fetchData()
        addTitle()
        addProfileImage()
        addHealthAlerts()
        addFlightMap()
        
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }

    }
    
    //Adds the title to the page
    func addTitle() {
        let title = UILabel()
        title.font = UIFont(name: "Inter-Regular_Bold", size: 32)
        title.textColor = .black
        title.text = "Summary"
        title.frame = CGRect(x: 30, y: 60, width: view.bounds.width-60, height: 50)
        view.addSubview(title)
    }
    
    func addProfileImage() {
        let image = UIImage(systemName: "person.circle.fill")
        let imageView = UIImageView(image: image)
        imageView.tintColor = .systemFill
        imageView.frame = CGRect(x: view.bounds.maxX-80, y: 60, width: 50, height: 50)
        
        view.addSubview(imageView)
        
    }
    
    func addHealthAlerts() {
        let title = UILabel()
        title.text = "Health"
        title.frame = CGRect(x: 30, y: view.bounds.height*0.15, width: view.bounds.width-60, height: 30)
        title.font = UIFont(name: "Inter-Regular_Bold", size: 20)
        title.textColor = .black
        
        let tableView = UITableView(frame: CGRect(x: 30, y: view.bounds.height*0.20, width: view.bounds.width-60, height: 300))
        setTableViewDelegates(tableView: tableView)
        tableView.backgroundColor = .clear
        tableView.register(HomeHealthTableViewCell.self, forCellReuseIdentifier: "cell")

        
        view.addSubview(tableView)
        view.addSubview(title)
    }
    
    func setTableViewDelegates(tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! HomeHealthTableViewCell
        let health = health[indexPath.section]
        
        cell.set(health: health)
        cell.backgroundColor = .white
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1)
        backgroundView.layer.cornerRadius = 10
        cell.selectedBackgroundView = backgroundView
        
//        cell.tintColor = .black
        cell.layer.cornerRadius = 10
        
        
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
}

extension HomeViewController {
    
    func fetchData() -> [Health] {
        let health1 = Health(image: Images.lungs!, title: "Breathing Rate")
        let health2 = Health(image: Images.heart!, title: "Heart Rate")
//        let health3 = Health(image: Images.stethoscope!, title: "Blood Oxygen")
//        let health4 = Health(image: Images.alert!, title: "Alertness")
//        let health5 = Health(image: Images.temp!, title: "Cabin Temp")
//        let health6 = Health(image: Images.carbon!, title: "Carbon Monoxide")
//
        return [health1, health2]
    }
}

