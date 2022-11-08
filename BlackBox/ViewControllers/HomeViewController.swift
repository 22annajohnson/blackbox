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

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        addTitle()
        addProfileImage()
        addHealthAlerts()
        addFlightMap()

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
        
        view.addSubview(title)
    }
    
    func addFlightMap() {
        let title = UILabel()
        title.text = "My Flights"
        title.frame = CGRect(x: 30, y: view.bounds.height*0.45, width: view.bounds.width-60, height: 30)
        title.font = UIFont(name: "Inter-Regular_Bold", size: 20)
        title.textColor = .black
        
        let map = SummaryMapView(frame: CGRect(x: 30, y: view.bounds.height*0.5, width: view.bounds.width-60, height: 200))
        map.layer.cornerRadius = 10
        map.delegate = self
        
        view.addSubview(title)
        view.addSubview(map)
    }
  


}

