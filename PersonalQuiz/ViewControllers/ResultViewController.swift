//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Илья Сесюнин on 07.07.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    var answers: [Answer]!
    
    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultTextLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        updateResult()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    private func updateResult() {
        var animalFrequency: [Animal: Int] = [:]
        let animals = answers.map { $0.animal }
        
        for animal in animals {
            animalFrequency[animal] = (animalFrequency[animal] ?? 0) + 1
        }
        
        let sortedAnimalFrequency = animalFrequency.sorted { $0.value > $1.value }
        guard let mostFrequencyAnimal = sortedAnimalFrequency.first?.key else { return }
        
        updateUI(with: mostFrequencyAnimal)
    }
    
    private func updateUI(with animal: Animal) {
        resultAnswerLabel.text = "Вы - \(animal.rawValue)!"
        resultTextLabel.text = "\(animal.definition)"
    }
}
