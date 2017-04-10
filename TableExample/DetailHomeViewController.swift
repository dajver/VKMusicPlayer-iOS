//
//  DetailHomeViewController.swift
//  TableExample
//
//  Created by Gleb on 09.04.17.
//  Copyright © 2017 Example. All rights reserved.
//

import Foundation
import UIKit

class DetailHomeViewController: UIViewController {

    @IBOutlet weak var one: UILabel!
    @IBOutlet weak var two: UILabel!
    
    var dictionary : [String:Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let dict = self.dictionary {
            self.one.text = dict["name"] as? String
            self.two.text = dict["email"] as? String
        }
    }
}
