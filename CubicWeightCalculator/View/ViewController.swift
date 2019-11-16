//
//  ViewController.swift
//  CubicWeightCalculator
//
//  Created by Nafisa Rahman on 11/16/19.
//  Copyright © 2019 com.nafisa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var activityInd: UIActivityIndicatorView!
    @IBOutlet weak var avgCubicWeightValLbl: UILabel!
    
    var objectViewModel = ObjectViewModel(withDataEndPoint: ObjectNetworking())

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.activityInd.startAnimating()
        
        objectViewModel.getAvgCubicWeight{ (avgCubicWeight) in
            self.activityInd.stopAnimating()
            self.avgCubicWeightValLbl.text = avgCubicWeight + " Kg"
        }
    }
}

