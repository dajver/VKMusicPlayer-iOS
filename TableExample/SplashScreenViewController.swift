//
//  SplashScreenViewController.swift
//  TableExample
//
//  Created by Gleb on 09.04.17.
//  Copyright © 2017 Example. All rights reserved.
//

import Foundation
import UIKit

class SplashScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let deadlineTime = DispatchTime.now() + .milliseconds(1000)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
            let viewController = HomeViewController.self.initWithNib()
            let navController = UINavigationController(rootViewController: viewController)
            self.navigationController?.present(navController, animated: true, completion: nil)
        }
    }
}
