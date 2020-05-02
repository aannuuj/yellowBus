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
    
    var busNo = ["1234","4566","5469","5995","9999 ","3939","9900","9393"]
    var busDeparture = ["6:10","7:20","7:35","7:55","8:10","9:10","3:10","4:10"]
    var ArivalTime = ["6:15","7:25","7:36","7:59","8:15","9:20","3:10","4:13"]
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
