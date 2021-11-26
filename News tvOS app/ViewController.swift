//
//  ViewController.swift
//  News tvOS app
//
//  Created by nayan.khadase on 17/11/21.
//  Copyright © 2021 nayan.khadase. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    let newsData = NewsData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        newsData.fetchData(for: "general")
    }


}

