//
//  ViewController.swift
//  CircleActivityIndicator
//
//  Created by ppth0608 on 03/30/2017.
//  Copyright (c) 2017 ppth0608. All rights reserved.
//

import UIKit
import CircleActivityIndicator

class ViewController: UIViewController {

    @IBOutlet weak var circleActivityIndicator: CircleActivityIndicator!
    
    @IBAction func animateButtonTapped(_ sender: UIButton) {
        circleActivityIndicator.animate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

