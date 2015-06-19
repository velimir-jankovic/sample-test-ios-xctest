//
//  ViewController.swift
//  BitriseTestingSample
//
//  Created by Viktor Benei on 6/17/15.
//  Copyright (c) 2015 Bitrise. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func testButtonTouched(sender: AnyObject) {
    }
    
    static func pingServer() -> Bool {
        let urlPath: String = "http://google.com"
        var url: NSURL = NSURL(string: urlPath)!
        var request1: NSURLRequest = NSURLRequest(URL: url)
        var response: NSURLResponse?
        var error: NSError?
        let urlData = NSURLConnection.sendSynchronousRequest(request1, returningResponse: &response, error: &error)
        if let httpResponse = response as? NSHTTPURLResponse {
            if(httpResponse.statusCode == 200)
            {
                return true
            } else {
                return false
            }
        }
        return false
    }
}

