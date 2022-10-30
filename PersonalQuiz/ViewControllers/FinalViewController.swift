//
//  FinalViewController.swift
//  PersonalQuiz
//
//  Created by Данил on 25.10.2022.
//

import UIKit

class FinalViewController: UIViewController {
    
    var answerChoosen: [Answer] = []
    
    @IBOutlet var discriptLabel: UILabel!
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        let result = getResult(answerChoosen: answerChoosen)
        resultLabel.text? = "Вы - \(result?.rawValue ?? " ")"
        discriptLabel.text = String(result?.definition ?? " ")
        
    }
    
     
}


extension FinalViewController {
    private func getResult(answerChoosen: [Answer]) -> Optional<AnimalType> {
        var result: [AnimalType : Int] = [.dog: 0, .cat: 0, .rabbit: 0, .turtle: 0]
        for answer in answerChoosen {
            if answer.type == .dog {
                result[.dog]! += 1
            } else if answer.type == .cat {
                result[.cat]! += 1
            } else if answer.type == .turtle {
                result[.turtle]! += 1
            } else {
                result[.rabbit]! += 1
            }
        }
        let max = result.max { a, b in a.value < b.value }
        return max?.key
    }
}
