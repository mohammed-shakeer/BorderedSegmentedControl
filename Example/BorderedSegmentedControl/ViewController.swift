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
    @IBOutlet weak var labelTitle: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        segmentedControl.normalFont =  UIFont.systemFont(ofSize: 17.0)
        segmentedControl.selectedFont =  UIFont.boldSystemFont(ofSize: 17.0)
        segmentedControl.normalColor =  UIColor.lightGray
        segmentedControl.selectedColor =  UIColor.purple
        displayTitle()
    }

    @IBAction func actionSegmentedControl(_ sender: UISegmentedControl) {
        
        displayTitle()
    }

    func displayTitle() {
        if let title = segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex) {
            labelTitle.text = "You have selected \(title) segment"
        }
    }

}

