//
//  MapNavigationBarVC.swift
//  ClimateLens3.0
//
//  Created by Brooke Ly on 2/21/18.
//  Copyright © 2018 Brooke Ly. All rights reserved.
//

import UIKit
import MapKit

class MapNavigationBarVC: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    var menuShowing = false
    var sliderShowing = false
    
    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    let manager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //let location = locations[0]
        //let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude,location.coordinate.longitude)
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.05, 0.05)
        let irvine:CLLocationCoordinate2D = CLLocationCoordinate2DMake(33.6404996,-117.8464849)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(irvine, span)
        myMap.setRegion(region, animated: true)
        
        self.myMap.showsUserLocation = true  //defaults to SF so I manually added pins for the arc and mstb
        let arc = Place(title: "ARC", coordinate: CLLocationCoordinate2D(latitude: 33.6434149, longitude: -117.830125), subtitle: "Anteater Recreation Center")
        let mstb = Place(title: "MSTB", coordinate: CLLocationCoordinate2D(latitude: 33.6425889, longitude: -117.8453053), subtitle: "Multipurpose Building")

        myMap.addAnnotations([arc, mstb])
        self.myMap.delegate = self

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        print("Hi")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        // 1
//        print("view for")
//        let identifier = "Place"
//        
//        // 2
//        if annotation is Place {
//            print("Yes Place")
//            // 3
//            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
//            
//            if annotationView == nil {
//                //4
//                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
//                annotationView!.canShowCallout = true
//                
//                // 5
//                let btn = UIButton(type: .detailDisclosure)
//                annotationView!.rightCalloutAccessoryView = btn
//            } else {
//                // 6
//                annotationView!.annotation = annotation
//            }
//            
//            return annotationView
//        }
//        
//        // 7
//        return nil
//    }
//    
//    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
//
//        print("callout")
//        if control == view.rightCalloutAccessoryView {
//            print("Trying to perform Segue1")
//            self.performSegue(withIdentifier: "ShowARScreenViewController", sender: self)
//        }
//    }
//    private func mapView(_ mapView: MKMapView, didSelect view: MKAnnotation) {
//        print("Trying to perform Segue2")
//        self.performSegue(withIdentifier: "ShowARScreenViewController", sender: self)
//        
//    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("Pin Tapped")
        self.performSegue(withIdentifier: "ShowARScreenViewController", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("in the prepare function")
        if segue.identifier == "ShowARScreenViewController"{
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let arscreenVC = storyBoard.instantiateViewController(withIdentifier: "arscreenVC")
            self.present(arscreenVC, animated: true, completion: nil)
        }
    }    
}
