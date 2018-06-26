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
        let switchSettingVal = Bundle.main.infoDictionary?["API_SWITCH"] ?? ""
        let switchSettingStr = NSString(format: "%@", switchSettingVal as! CVarArg)
        
        let msg = "API_SWITCH: \(switchSettingStr.boolValue)\n\n"
        textView.text = msg + "\(Bundle.main.infoDictionary)"
    }

}

