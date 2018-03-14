//
//  arscreenVC.swift
//  ClimateLens3.0
//
//  Created by Brooke Ly on 2/22/18.
//  Copyright © 2018 Brooke Ly. All rights reserved.
//

import UIKit

class arscreenVC: UIViewController {
    
    @IBOutlet weak var sliderView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func sliderClickedDown(_ sender: AnyObject) {
        sliderView.isHidden = !sliderView.isHidden
    }
    
}
