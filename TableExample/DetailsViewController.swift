//
//  DetailsViewController.swift
//  TableExample
//
//  Created by Gleb on 06.04.17.
//  Copyright © 2017 Example. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var emailText: UILabel!
   
    public var passedValue : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleText.text = passedValue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
