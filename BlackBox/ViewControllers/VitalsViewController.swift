//
//  VitalsViewController.swift
//  BlackBox
//
//  Created by Anna Johnson on 11/8/22.
//

import UIKit
import MapKit

class VitalsViewController: UIViewController {

    var health: [Health] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        health = fetchData()
        addTitle()
        addProfileImage()
        addHealth()
        
    }
    
    //Adds the title to the vire controller
    func addTitle() {
        let title = UILabel()
        title.font = UIFont(name: "Inter-Regular_Bold", size: 32)
        title.textColor = .black
        title.text = "Vitals"
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
    func addHealth() {

        let tableView = UITableView(frame: CGRect(x: 30, y: view.bounds.height*0.15, width: view.bounds.width-60, height: view.bounds.height*0.75))
        setTableViewDelegates(tableView: tableView)
        tableView.backgroundColor = .clear
        //customizes the TableViewCell
        tableView.register(HomeHealthTableViewCell.self, forCellReuseIdentifier: "cell")

        
        view.addSubview(tableView)
    }
    
    //Sets the delegats for the table view
    func setTableViewDelegates(tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
    }

    

}

extension VitalsViewController: UITableViewDelegate, UITableViewDataSource {
    
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

extension VitalsViewController {
    
    func fetchData() -> [Health] {
        let health1 = Health(image: HealthImages.lungs!, title: "Breathing Rate")
        let health2 = Health(image: HealthImages.heart!, title: "Heart Rate")
        let health3 = Health(image: HealthImages.stethoscope!, title: "Blood Oxygen")
        let health4 = Health(image: HealthImages.alert!, title: "Alertness")
        let health5 = Health(image: HealthImages.temp!, title: "Cabin Temp")
        let health6 = Health(image: HealthImages.carbon!, title: "Carbon Monoxide")

        return [health1, health2, health3, health4, health5, health6]
    }
}
