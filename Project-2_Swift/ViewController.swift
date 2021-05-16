//
//  ViewController.swift
//  Project-2_Swift
//
//  Created by narendra.vadde on 16/05/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderWidth = 1
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderWidth = 1
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        
        countries.shuffle()
        
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased() + " Score: \(score)"
    }
    
    @IBAction func flagTapped(_ sender: UIButton) {
        var title = String()
        var message = String()
        
        if sender.tag == correctAnswer {
            title = "Correct Answer"
            score += 1
            message = "Your Score is \(score)"
        } else {
            title = "Wrong Answer"
            score -= 1
            message = "Your Score is \(score) & you have tapped on \(countries[sender.tag].capitalized)"
        }
        
        if score == 10 {
            title = "Congratulations"
            message = "You qualified for next level"
            score = 0
        }
        
        let alerController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Continue", style: .default, handler: askQuestion)
        alerController.addAction(alertAction)
        present(alerController, animated: true, completion: nil)
        
    }
    
}

