//
//  ViewController.swift
//  MyDNC
//
//  Created by Sandeep Singh on 12/5/19.
//  Copyright © 2019 Sandeep Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ArticleSegue" {
            let destination = segue.destination as! UINavigationController
            let destinationController = destination.topViewController as! ArticleViewController
            if let buttonTitle = (sender as? UIButton)?.titleLabel?.text {
                destinationController.candidateName = buttonTitle
            }
        }
    }
    
    
    @IBAction func selectCandidate(sender: AnyObject) {
        guard let button = sender as? UIButton else {
            return
        }
    
        switch button.tag {
            case 0:
                self.performSegue(withIdentifier: "ArticleSegue", sender: sender)
            case 1:
                self.performSegue(withIdentifier: "ArticleSegue", sender: sender)
            case 2:
                self.performSegue(withIdentifier: "ArticleSegue", sender: sender)
            case 3:
                self.performSegue(withIdentifier: "ArticleSegue", sender: sender)
            case 4:
                self.performSegue(withIdentifier: "ArticleSegue", sender: sender)
            case 5:
                self.performSegue(withIdentifier: "ArticleSegue", sender: sender)
            case 6:
                self.performSegue(withIdentifier: "ArticleSegue", sender: sender)
            case 7:
                self.performSegue(withIdentifier: "ArticleSegue", sender: sender)
            case 8:
                self.performSegue(withIdentifier: "ArticleSegue", sender: sender)
            case 9:
                self.performSegue(withIdentifier: "ArticleSegue", sender: sender)
            case 10:
                self.performSegue(withIdentifier: "ArticleSegue", sender: sender)
            case 11:
                self.performSegue(withIdentifier: "ArticleSegue", sender: sender)
            default:
                print("ERROR")
            return
        }
    }
    
    
}

