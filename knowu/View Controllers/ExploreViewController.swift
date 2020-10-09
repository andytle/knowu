//
//  ExploreViewController.swift
//  knowu
//
//  Created by Sabrina Contaldi on 29/07/2020.
//  Copyright © 2020 Andy Le. All rights reserved.
//

//import Foundation
import UIKit

class ExploreViewController: UIViewController {
    
    @IBOutlet weak var KnowUButton: UIButton!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setUpElements()
    }

    func setUpElements()
    {
        Utilities.styleFilledButton(KnowUButton)
    }
}
