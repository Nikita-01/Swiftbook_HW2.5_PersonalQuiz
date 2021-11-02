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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        let result = calculateResult(answers: choosenAnswers)
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
        var result = AnimalType.dog

        switch winAnimal {
        case dogCount:
            result = AnimalType.dog
        case catCount:
            result = AnimalType.cat
        case rabbitCount:
            result = AnimalType.rabbit
        case turtleCount:
            result = AnimalType.turtle
        default:
            break
        }
        return result
    }
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результаты в соотвствии с этим животным
    // 4. Избавиться от кнопки возврата назад на экране результатов
    
}
