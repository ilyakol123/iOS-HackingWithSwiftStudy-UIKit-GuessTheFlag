//
//  ViewController.swift
//  Guess The Flag
//
//  Created by Илья Колесников on 11.12.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    
    @IBOutlet var button2: UIButton!
    
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionAsked = 0
    let numberOfQuestions = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(scoreCheck))
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        
        askQuestion()
        //test
        // Do any additional setup after loading the view.
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = Int.random(in: 0...2)
        title = "\(countries[correctAnswer].uppercased()) Score: \(score)"
        
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        var titleText: String
        var messageText: String
        
        if sender.tag == correctAnswer {
            titleText = "Correct!"
            score += 1
            messageText = "Your score is: \(score)"
            
        } else {
            titleText = "Wrong!"
            messageText = "You've chosen \(countries[sender.tag].uppercased()), your score is: \(score)"
            
        }
        
        if questionAsked < numberOfQuestions-1 {
            let ac = UIAlertController(title: titleText, message: messageText, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
            questionAsked += 1
        } else {
            let ac = UIAlertController(title: titleText, message: "Game finished, Your final score is: \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "New Game", style: .default, handler: askQuestion))
            present(ac, animated: true)
            questionAsked = 0
            score = 0
        }
    
    }
    @objc func scoreCheck() {
        
        let ac = UIAlertController(title: "Current Score", message: "\(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue the game", style: .default, handler: .none))
        present(ac, animated: true)
    }
    

}

