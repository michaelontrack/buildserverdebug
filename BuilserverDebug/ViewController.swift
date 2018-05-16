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
        let date = Date.distantPast
        let stringDate = "\(date)"
        print("=== 1: ", stringDate)
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")!
        dateFormatter.locale = Locale(identifier: "en_GB")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let dateString2 = dateFormatter.string(from: date)
        print("=== 2: ", dateString2)
        let date2 = NSDate()
        print("=== 3: ", date2.sam_ISO8601String())
        print("=== 4: ", date.iso8601())
        print("=== 5: ", Date.distantPast.iso8601())
        print("=== 6: ", Formatter.rfc3339.string(from: date))
        print("=== 7: ", Formatter.rfc3339.string(from: Date.distantPast))
        
        
    }

}

extension Date {
    
    func iso8601() -> String {
        let buffer = UnsafeMutablePointer<CChar>.allocate(capacity: 80)
        var rawtime = time_t(self.timeIntervalSince1970)
        print("raw time", rawtime)
        let timeinfo = gmtime(&rawtime);
        strftime(buffer, 80, "%Y-%m-%dT%H:%M:%SZ", timeinfo)
        return String(cString: buffer, encoding: .utf8)!
    }
}

//- (NSString *)sam_ISO8601String {
//    struct tm *timeinfo;
//    char buffer[80];
//
//    time_t rawtime = (time_t)[self timeIntervalSince1970];
//    timeinfo = gmtime(&rawtime);
//
//    strftime(buffer, 80, "%Y-%m-%dT%H:%M:%SZ", timeinfo);
//
//    return [NSString stringWithCString:buffer encoding:NSUTF8StringEncoding];
//}

extension Formatter {
    static let rfc3339: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
        return formatter
    }()
}
