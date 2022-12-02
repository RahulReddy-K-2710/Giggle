//
//  NetworkManager.swift
//  Giggle
//
//  Created by Abhishek on 25/11/22.
//
/*
 Network Manager -
 takes a url, downloads data, returns data in completion handler
 url - url, init
 completion - typealias
 returns data -
 1.Create a URL object from url string.
 2.Create a request object from url.
 3.Create a session object.
 4.Create a task object.
 5.Return the Download data in completion.
 6.strat the task.
 */

import Foundation

struct NetworkManager {
    var url: String
    typealias Completion = (Data) -> Void
    
    init(url: String) {
        self.url = url
    }
    
    func fetchData(completion: @escaping Completion) {
        //Create a URL object from url string
        if let url = URL(string: self.url) {
            //Create a request objet from URL
            let urlRequest = URLRequest(url: url)
            //Create a session object
            let session = URLSession(configuration: .default)
            //Create a task object
            let task = session.dataTask(with: urlRequest) { data, response, error in
                //Return the downloaded data in completion
                if let data = data {
                    completion(data)
                }
            }
            //Start the task
            task.resume()
        }
    }
}
