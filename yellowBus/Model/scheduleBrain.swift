//
//  scheduleBrain.swift
//  yellowBus
//
//  Created by Hariom Palkar on 25/04/20.
//  Copyright © 2020 Hariom Palkar. All rights reserved.
//

import Foundation
import Alamofire

struct BusDetails {
    
    var busNo = ["TN 11 C 1234","TN 11 C 4566","TN 11 BB 5469","TN 39 V 5995","TN 11 U 9999 ","TN 11 C 3939","TN 11 J 9900","TN 11 C 9393"]
    var busTime = ["6:10","7:20","7:35","7:55","8:10","9:10","3:10","4:10"]
    
    let url = "https://jsonplaceholder.typicode.com/posts"
   
    func getData(busNo : String) {
      let url = "https://jsonplaceholder.typicode.com/posts"
       print (url)
        requestData(url: url)
    }
    func requestData(url: String){
        // 1. create url
        if let url = URL(string: url){
           // 2.Create URL session to perform networking like browser
            let session = URLSession(configuration: .default)
            //3.Give the session a task
            
            //completion handler is function that handels what has to be done while fetching data
            
            let task = session.dataTask(with: url, completionHandler: handel(data:response:error:))
            //4. Start the task
            task.resume()
        }
        
    }
    func handel(data: Data?, response: URLResponse?, error: Error?){
        if error != nil{
            print(error!)
            return
        }
        if let safeData = data {
            _ = String(data: safeData, encoding: .utf8)
            
        }
    }
    
    func requestBus(){
        
    }
    
    func setAlarm(){
        
    }
}
