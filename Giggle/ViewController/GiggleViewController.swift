//
//  ViewController.swift
//  Giggle
//
//  Created by Abhishek on 25/11/22.
//

import UIKit

class GiggleViewController: UIViewController {
    
    //MARK: Outlets.
    @IBOutlet weak var descTextView: UITextView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var perviousButton: UIButton!
    @IBOutlet weak var lightDarkSegentController: UISegmentedControl!
    
    //MARK: Properties.
    let viewModel = GiggleViewModel()
    var cacheJokes = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descTextView.text = "Time waits for no man. Unless that man is Chuck Norris."
    }
    // Create the nxt joke function.
    @IBAction func setUpJoke() {
        viewModel.getViewModel { Norries in
            DispatchQueue.main.async {
                guard let joke = Norries?.joke else { return }
                //store the jokes in jokesCache.
                self.cacheJokes.append(joke)
                self.descTextView.text = joke
            }
        }
    }
    // Create function for previous.
    @IBAction func previousJoke() {
        guard let recentJoke = cacheJokes.last else {
            descTextView.text = "No Previous Jokes"
            return
        }
        descTextView.text = recentJoke
        cacheJokes.removeLast()
    }
    
}
