//
//  ViewController.swift
//  BuilserverDebug
//
//  Created by Michael Inger on 20/04/2018.
//  Copyright © 2018 On Track Retail Limited. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userVar = Bundle.main.infoDictionary?["API_SWITCH"] ?? ""
        let msg = "API_SWITCH: \(userVar)\n\n"
        textView.text = msg + "\(Bundle.main.infoDictionary)"
    }

}

