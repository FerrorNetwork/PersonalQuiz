//
//  Answer.swift
//  PersonalQuiz
//
//  Created by Данил on 25.10.2022.
//


struct Answer {
    let text: String
    let type: AnimalType
}

enum AnimalType: Character {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    var definition: String {
        switch self {
        case .dog:
            return "Собака"
        case .cat:
            return "Кошка"
        case .rabbit:
            return "Кролик"
        case .turtle:
            return "Черепаха"
        }
    }
}


