//
//  QuestionViewController.swift
//  PersonalQuiz
//
//  Created by Данил on 25.10.2022.
//

import UIKit

class QuestionViewController: UIViewController {
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var questionLable: UILabel!
    @IBOutlet var rangedSlider: UISlider! {
        didSet {
            let answerCount = Float(currentAnswers.count - 1)
            rangedSlider.value = answerCount
        }
    }
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var rangeStackView: UIStackView!
    
    @IBOutlet var singleButtons: [UIButton]!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitcher: [UISwitch]!
    @IBOutlet var rangedLables: [UILabel]!
    
    // MARK: Properties
    private let questions = Question.getQuestions()
    private var currentIndex = 0
    private var answerChosen: [Answer] = []
    private var currentAnswers: [Answer] {
        questions[currentIndex].answers
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func singleButtonAnswerPressed(_ sender: UIButton) {
        guard let currentIndex = singleButtons.firstIndex(of: sender) else { return }
        
        let currentAnswer = currentAnswers[currentIndex]
        answerChosen.append(currentAnswer)
        
        newQuestion()
    }
    
    @IBAction func multipleAnswerPressed() {
        for (multioleSwitch, answer) in zip(multipleSwitcher, currentAnswers) {
            if multioleSwitch.isOn {
                answerChosen.append(answer)
            }
        }
        
        newQuestion()
    }
    
    
    @IBAction func rangedAnswerButtonPressed() {
        let index = Int(rangedSlider.value)
        answerChosen.append(currentAnswers[index])
        
        newQuestion()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard segue.identifier == "showResult" else { return }
            guard let destination = segue.destination as? FinalViewController else { return }
            destination.answerChoosen = answerChosen
        }
}



// MARK: - Private
extension QuestionViewController {
    private func updateUI() {
        for stackView in [singleStackView, multipleStackView, rangeStackView] {
            stackView?.isHidden = true
        }
        let currentQuestion = questions[currentIndex]
        questionLable.text = currentQuestion.text
        
        let totalProgress = Float(currentIndex) / Float(questions.count)
        progressView.setProgress(totalProgress, animated: true)
        
        title = "Вопрос №\(currentIndex + 1) из \(questions.count)"
        
        showCurrentStackView(for: currentQuestion.type)
    }
    
    private func showCurrentStackView(for type: ResponseType) {
        switch type {
        case .single:
            showSingleStackView(with: currentAnswers)
        case .multiple:
            showMultipleStackView(with: currentAnswers)
        case .range:
            showRangeStackView(with: currentAnswers)
        }
    }
    
    private func showSingleStackView(with answers: [Answer]) {
        singleStackView.isHidden = false
        
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.text, for: .normal)
        }
    }
    
    private func showMultipleStackView(with answers: [Answer]) {
        multipleStackView.isHidden = false
        
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.text
        }
    }
    
    private func showRangeStackView(with answers: [Answer]) {
        rangeStackView.isHidden = false
        
        rangedLables.first?.text = answers.first?.text
        rangedLables.last?.text = answers.last?.text
    }
    
    private func newQuestion() {
        currentIndex += 1
        
        if currentIndex < questions.count {
            updateUI()
            return
        }
        
        performSegue(withIdentifier: "showResult", sender: nil)
    }
    
    
}
