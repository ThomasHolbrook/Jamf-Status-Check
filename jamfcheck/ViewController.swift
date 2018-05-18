//
//  ViewController.swift
//  jamfcheck
//
//  Created by Thomas Holbrook on 17/05/2018.
//  Copyright © 2018 Thomas Holbrook. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var label_jssStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        
        let (jssStatus, jssReady) = jss.checkJssStatus(host: "jss.demo.jigsaw24.com")
        
        label_jssStatus.text = jssStatus
        
        if jssReady == true {
            
            label_jssStatus.textColor = UIColor.green
        }
            
        else {
            
            label_jssStatus.textColor = UIColor.red
        
        }
        
        label_jssStatus.isHidden = false
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

