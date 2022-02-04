//
//  UserListView.swift
//  ITSTest
//
//  Created by Максим on 18.01.22.
//

import Foundation
import UIKit
import MapKit

class UserInfoView: UIView {
    
    struct Size {
        
    }
    
    // MARK: - Private Properties
    
    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    private let aboutLabel: UILabel = {
        let ageLabel = UILabel()
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        ageLabel.numberOfLines = 0
        return ageLabel
    }()
    
    private let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        createSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal methods
    
    func setupUserInfo(name: String, about: String) {
        nameLabel.text = name
        aboutLabel.text = about
    }
    
    func setupMap(latitude: Double, longitude: Double, name: String, address: String) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        annotation.title = address
        annotation.subtitle = name
        let region = MKCoordinateRegion(center: annotation.coordinate,
                                        latitudinalMeters: 10000,
                                        longitudinalMeters: 10000)
        mapView.addAnnotation(annotation)
        mapView.setRegion(region, animated: true)
    }
    
    // MARK: - Private Methods

    private func createSubviews() {
        addSubview(nameLabel)
        addSubview(aboutLabel)
        addSubview(mapView)

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLabel.widthAnchor.constraint(equalToConstant: 200),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            aboutLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            aboutLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            aboutLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            aboutLabel.bottomAnchor.constraint(lessThanOrEqualTo: mapView.topAnchor, constant: -8),
            
            mapView.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor, constant: 16),
            mapView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
