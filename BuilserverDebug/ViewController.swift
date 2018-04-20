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
        let env = ProcessInfo.processInfo.environment
        let apiSwitch = Bool(env["API_SWITCH"] ?? "") ?? false
        var msg = "API_SWITCH: \(apiSwitch)\n\n"
        for (key, val) in env {
            msg += "\(key): \(val)\n\n"
        }
        textView.text = msg
    }

}

