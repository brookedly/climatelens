//
//  Place.swift
//  ClimateLens3.0
//
//  Created by Brooke Ly on 3/13/18.
//  Copyright © 2018 Brooke Ly. All rights reserved.
//

import MapKit
import UIKit

class Place: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var subtitle: String?
    
    init(title: String, coordinate: CLLocationCoordinate2D, subtitle: String) {
        self.title = title
        self.coordinate = coordinate
        self.subtitle = subtitle
    }
}
