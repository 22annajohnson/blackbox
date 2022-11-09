//
//  HomeHealthTableViewCell.swift
//  BlackBox
//
//  Created by Anna Johnson on 11/8/22.
//

import UIKit

class SensorTableViewCell: UITableViewCell {

    var healthImageView = UIImageView()
    var healthTitleLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(healthImageView)
        addSubview(healthTitleLabel)
        //we need to change this color
        tintColor = UIColor(red: 0/255, green: 85/255, blue: 187/255, alpha: 1)

        configureIconView()
        configureTitleLabel()
        setImageConstraints()
        setTitleLabelConstraints()
     
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(health: Sensor) {
        healthImageView.image = health.image
        healthImageView.contentMode = .scaleAspectFit
        healthTitleLabel.text = health.title
        
    }
    
    func configureIconView() {
        healthImageView.layer.cornerRadius = 10
        healthImageView.clipsToBounds = true
    }
    
    func configureTitleLabel() {
        healthTitleLabel.numberOfLines = 0
        healthTitleLabel.adjustsFontSizeToFitWidth = true
        healthTitleLabel.font = UIFont(name: "Inter-Regular_Bold", size: 18)
        healthTitleLabel.textColor = .black
    }
    
    func setImageConstraints() {
        healthImageView.translatesAutoresizingMaskIntoConstraints = false
        healthImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        healthImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        healthImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        healthImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setTitleLabelConstraints() {
        healthTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        healthTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        healthTitleLabel.leadingAnchor.constraint(equalTo: healthImageView.trailingAnchor, constant: 20).isActive = true
        healthTitleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        healthTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    


}
