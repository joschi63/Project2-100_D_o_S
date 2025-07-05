//
//  ViewController.swift
//  Project2
//
//  Created by Johann Schneider on 28.06.25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    @IBOutlet var scoreText: UILabel!
    @IBOutlet var numberText: UILabel!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var answered = 0
    let maxGames = 10
    
    var reset = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        scoreText.text = "Your current score: \(score)"
        numberText.text = "\(answered) / \(maxGames)"
        
        askQuestion()
        
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = Int.random(in: 0...2)
        
        title = countries[correctAnswer].uppercased()

    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var message: String
        var buttonTitle: String
        
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong \nThat's the flag of \(countries[sender.tag].uppercased())"
            score -= 1
        }
        answered += 1
        
        scoreText.text = "Your current score: \(score)"
        numberText.text = "\(answered) / \(maxGames)"
        
        if answered < maxGames - 1 && !reset{
            message = ""
            buttonTitle = "Continue"
    
        } else {
            message = "Game Over! \nYou've played \(answered) games \nYour final score: \(score)"
            buttonTitle = "Reset"
            
            score = 0
            answered = 0
        }
       
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: askQuestion))
        present(ac, animated: true)
        
        
    }
    
}

