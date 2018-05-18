//
//  TJHJssCheck.swift
//  ios-info
//
//  Created by Thomas Holbrook on 17/05/2018.
//  Copyright © 2018 Thomas Holbrook. All rights reserved.
//

import Foundation

class jss {
    
    class func checkJssStatus(host: String) -> (String, Bool) {
        
        let jssUrl = "https://" + host + "/healthCheck.html"
        print(jssUrl)
        var jssStatus = ""
        var jssReady = false
        
        if let url = URL(string: jssUrl) {
            
            do {
                let contents = try String(contentsOf: url)
                
                if contents.contains("[{\"healthCode\":1,\"httpCode\":503,\"description\":\"DBConnectionError\"}]") {
                    jssStatus = "An error occurred while testing the database connection."
                    jssReady = false
                }
                else if contents.contains("[{\"healthCode\":2,\"httpCode\"200:,\"description\":\"SetupAssistant\"}]") {
                    jssStatus = "The JSS Setup Assistant was detected."
                    jssReady = false
                }
                else if contents.contains("[{\"healthCode\":3,\"httpCode\":503,\"description\":\"DBConnectionConfigError\"}]") {
                    jssStatus = "A configuration error occurred while attempting to connect to the database."
                    jssReady = false
                }
                else if contents.contains("[{\"healthCode\":4,\"httpCode\":503,\"description\":\"Initializing\"}]") {
                    jssStatus = "The JSS web application is initializing."
                    jssReady = false
                }
                else if contents.contains("[{\"healthCode\":5,\"httpCode\":503,\"description\":\"ChildNodeStartUpError\"}]") {
                    jssStatus = "An instance of the JSS web application in a clustered environment failed to start."
                    jssReady = false
                }
                else if contents.contains("[{\"healthCode\":6,\"httpCode\":503,\"description\":\"InitializationError\"}]") {
                    jssStatus = "A fatal error occurred and prevented the JSS web application from starting."
                    jssReady = false
                }
                else if contents.contains("[]") {
                    jssStatus = "The JSS web application is running without error."
                    jssReady = true
                }
                else {
                    jssStatus = "A fatal error occurred."
                    jssReady = false
                }
                
            } catch {
                print("error")
            }
        } else {
            print("error")
        }
        
        return ( jssStatus, jssReady)
    }
    
}
