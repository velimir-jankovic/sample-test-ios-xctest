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
        testLabel.hidden = true;
        let urlPath: String = "http://google.com"
        var url: NSURL = NSURL(string: urlPath)!
        var request1: NSURLRequest = NSURLRequest(URL: url)
        let queue:NSOperationQueue = NSOperationQueue()
        NSURLConnection.sendAsynchronousRequest(request1, queue: queue, completionHandler:{ (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var err: NSError
            let httpResponse = response as? NSHTTPURLResponse
            let responseStatus = httpResponse!.statusCode;
            if(responseStatus == 200)
            {
                dispatch_async(dispatch_get_main_queue()) {
                    self.testLabel.text = "Great Success! We got status " + String(stringInterpolationSegment: responseStatus) + (" from the server! Nice job!");
                    self.testLabel.hidden = false;
                }
            }
            else
            {
                dispatch_async(dispatch_get_main_queue()) {
                self.testLabel.text = "Oh no! We got status " + String(stringInterpolationSegment: responseStatus) + (" from the server!");
                self.testLabel.hidden = false;
                }
            }
        })
    }
}

