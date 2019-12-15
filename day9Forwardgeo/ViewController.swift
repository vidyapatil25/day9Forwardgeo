//
//  ViewController.swift
//  day9Forwardgeo
//
//  Created by Felix-ITS016 on 27/11/19.
//  Copyright © 2019 Felix. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController,MKMapViewDelegate,UITextFieldDelegate

{

   
    
    
    
    @IBOutlet weak var MapView: MKMapView!
    @IBOutlet weak var SearchText: UITextField!
   
    
    
    override func viewDidLoad() {
        SearchText.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       let geo = CLGeocoder()
        geo.geocodeAddressString(SearchText.text!) { (placemarks, error) in
            let coordinate = placemarks?.first!.location?.coordinate
            let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            let region = MKCoordinateRegion(center:coordinate!, span: span)
            self.MapView.setRegion(region, animated: true)
           let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate!
            self.MapView.addAnnotation(annotation)
        }
        
    return true
    }

}

