//
//  ViewController.swift
//  BorderedSegmentedControl
//
//  Created by Mohammed Shakeer on 03/10/2020.
//  Copyright (c) 2020 Mohammed Shakeer. All rights reserved.
//

import UIKit
import BorderedSegmentedControl

class ViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl.normalFont =  UIFont.systemFont(ofSize: 17.0)
        segmentedControl.selectedFont =  UIFont.boldSystemFont(ofSize: 17.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

