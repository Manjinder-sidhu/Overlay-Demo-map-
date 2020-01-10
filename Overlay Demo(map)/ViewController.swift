//
//  ViewController.swift
//  Overlay Demo(map)
//
//  Created by Manjinder Aulakh on 2020-01-10.
//  Copyright © 2020 Manjinder kaur. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController ,CLLocationManagerDelegate{
    
    var locationManager = CLLocationManager()

    
    @IBOutlet weak var mapView: MKMapView!
    
    let places = Place.getPlaces()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
//        locationManager.startUpdatingLocation()
    }

    func addAnnotations(){
        mapView.delegate = self
        mapView.addAnnotations(places)
    }
}

extension ViewController : MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation{
            
            return nil
        }else{
            let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "annotationView") ?? MKAnnotationView()
            annotationView.image = UIImage(named: "ic_place_2x")
            return annotationView
        }
    }
    
}
