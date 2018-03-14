//
//  OnboardingVC.swift
//  ClimateLens3.0
//
//  Created by Brooke Ly on 3/8/18.
//  Copyright © 2018 Brooke Ly. All rights reserved.
//

import UIKit

class OnboardingVC: UIViewController, UIScrollViewDelegate {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let instruction1 = ["instruction":"Filter through many participation options that speak to you!", "image":"hack card"]
    let instruction2 = ["instruction":"Find something you like? Comment, like, or sign your favorites!", "image":"hotspot"]
    let instruction3 = ["instruction":"Find Hotspots to learn and explore about that area through AR!", "image":"hotspot"]
    let instruction4 = ["instruction":"Find your recent activity here!", "image":"icons8-clipboard-30"]
    
    var images: [String] = ["onboard1","onboard2","onboard3", "onboard4"]
    let instructions: [String] = ["Filter through many participation options that speak to you!","Find something you like? Comment, like, or sign your favorites!","Find Hotspots to learn and explore about that area through AR!","Find your recent activity here!"]
    var frame = CGRect(x:0, y:0, width:0, height: 0)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = images.count
        
        for index in 0..<images.count {

            let imgToDisplay = UIImage(named: images[index])
            let imageView = UIImageView(image: imgToDisplay)
            
//            let text:UILabel = UILabel()
//            text.numberOfLines = 2
//            text.intrinsicContentSize.width
//            text.textColor = UIColor.white
//            text.text = instructions[index]
//            text.sizeToFit()
//            
            
            let xCoord = view.frame.midX + view.frame.width * CGFloat(index)
            
            scrollView.addSubview(imageView)
//            scrollView.addSubview(text)
            imageView.frame = CGRect(x: xCoord - 150, y: (view.frame.height/2)-150, width: 300, height: 350)

//            text.frame = CGRect(x: xCoord - 50, y: (view.frame.height/2)-75, width: 100, height: 100)
            
        }
        
        scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(images.count)), height: scrollView.frame.size.height)
        scrollView.delegate = self
        
        
        
        
    }
    
    //scrollView method
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
    }
    
    
}
