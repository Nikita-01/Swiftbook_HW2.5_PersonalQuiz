//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Nikita Zharinov on 01/11/2021.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var resultDescriptionLabel: UILabel!
    
    var choosenAnswers: [Answer]!
    
    let questions = Question.getQuestions()
    var result = AnimalType.dog
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        result = calculateResult(answers: choosenAnswers)
        resultLabel.text = "\(result) - \(String(result.rawValue))"
        resultDescriptionLabel.text = result.definition
        
    }

    func calculateResult(answers: [Answer]) -> AnimalType {
        var dogCount = 0
        var catCount = 0
        var rabbitCount = 0
        var turtleCount = 0

        for answer in choosenAnswers {
            switch answer.type {
            case .dog:
                dogCount += 1
            case .cat:
                catCount += 1
            case .rabbit:
                rabbitCount += 1
            case .turtle:
                turtleCount += 1
            }
        }
        let animalsCount = [dogCount, catCount, rabbitCount, turtleCount]
        let winAnimal = animalsCount.sorted(by: >).first
        var animalType = AnimalType.dog

        switch winAnimal {
        case dogCount:
            animalType = AnimalType.dog
        case catCount:
            animalType = AnimalType.cat
        case rabbitCount:
            animalType = AnimalType.rabbit
        case turtleCount:
            animalType = AnimalType.turtle
        default:
            break
        }
        return animalType
    }
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результаты в соотвствии с этим животным
    // 4. Избавиться от кнопки возврата назад на экране результатов
    
}
