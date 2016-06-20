//
//  ViewController.swift
//  Giggle
//
//  Created by Jenifer  on 6/17/16.
//  Copyright © 2016 Jenifer . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var jokeTextView: UITextView!
    
    var giggle: String = "" {
        didSet{
            jokeTextView.text = "\(giggle)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Giggle"
         self.navigationController!.navigationBar.barTintColor = UIColor(red: 255/255.0, green: 250/255.0, blue:102/255.0, alpha: 1)
        newJoke()
        
    }

    func newJoke()  {
        JokeService.fetchJoke { (randomJoke) -> Void in
            if let randomJoke = randomJoke {
                dispatch_async(dispatch_get_main_queue()) {
                    guard let joke = randomJoke.giggle
                        else {
                            return
                    }
                    
                    self.giggle = joke
                }
                
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func buttonClick(sender: AnyObject) {
        
        newJoke()
        
    }
}

