//
//  ViewController.swift
//  WebViewDemo
//
//  Created by Ravi Shankar on 08/07/14.
//  Copyright (c) 2014 Ravi Shankar. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController ,CLLocationManagerDelegate  {
    
    @IBOutlet var webView: UIWebView!
    var locationManager: CLLocationManager!
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL(string: "https://watchdogskrajina.herokuapp.com/mobile/index.html")
        NSURLCache.sharedURLCache().removeAllCachedResponses()
        NSURLCache.sharedURLCache().diskCapacity = 0
        NSURLCache.sharedURLCache().memoryCapacity = 0
        let request = NSURLRequest(URL: url!)
        
        webView.loadRequest(request)
        
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func centriraj(AnyObject) {
        
        let location = locationManager.location
        
        
        let lat = NSString(format: "%.2f", location.coordinate.latitude)
        let long = NSString(format: "%.2f", location.coordinate.longitude)
        webView.stringByEvaluatingJavaScriptFromString("centriraj("+lat+","+long+")")
    }
    
    @IBAction func zamijeni(AnyObject) {
        webView.stringByEvaluatingJavaScriptFromString("zamijeni()")
    }
    


}

