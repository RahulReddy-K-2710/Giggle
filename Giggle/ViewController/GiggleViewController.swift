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
    @IBOutlet weak var tapButton: UIButton!
    //MARK: Properties.
    let viewModel = GiggleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set jokes.
        
    }
    
    @IBAction func setUpJoke() {
        viewModel.getViewModel { Norries in
            DispatchQueue.main.async {
                guard let joke = Norries?.joke else { return }
                self.descTextView.text = joke
            }
        }
    }
    
}
