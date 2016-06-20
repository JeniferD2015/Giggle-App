//
//  JokeService.swift
//  Giggle
//
//  Created by Jenifer  on 6/17/16.
//  Copyright © 2016 Jenifer . All rights reserved.
//

import Foundation

struct JokeService {

private static let baseURL = "http://api.icndb.com/jokes/random"


private static func constructURL() -> NSURL? {
    //Base URL
    let jokeURLComponent = NSURLComponents(string: baseURL)
    
    //Returns the complete URL
    return (jokeURLComponent?.URL)
    
}

    static func fetchJoke (completion: Joke? -> Void) {
        
        if let url = constructURL() {
            let nwOperator = NetworkOperator.init(url: url)
            nwOperator.getData({ (jsonDict) -> Void in
                let joke = parseData(jsonDict)
                completion(joke)
            })
        }
    }

    static func parseData(jsonObj: [String:AnyObject]?) -> Joke? {
        var joke = Joke()
        
        if let dict = jsonObj!["value"] {
            joke.giggle = (dict["joke"] as? String)
        }
        
        return joke
    }
    
}