//
//  ConnectionHelper.swift
//  BitriseTestingSample
//
//  Created by Tamás Bazsonyi on 6/19/15.
//  Copyright (c) 2015 Bitrise. All rights reserved.
//

import UIKit

class ConnectionHelper: NSObject {
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
