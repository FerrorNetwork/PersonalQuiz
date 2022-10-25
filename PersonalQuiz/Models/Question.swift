//
//  Question.swift
//  PersonalQuiz
//
//  Created by Данил on 25.10.2022.
//

enum ResponseType {
    case single
    case multiple
    case range
}

struct Question {
    let text: String
    let type: ResponseType
    let answers: [Answer]
}

extension Question {
    static func getQuestions() -> [Question] {
        return [
            Question(text: "Какую пищу вы предпочитаете?", type: .single,
                     answers: [
                        Answer(text: "Стейк", type: .dog),
                        Answer(text: "Морковь", type: .rabbit),
                        Answer(text: "Рыба", type: .cat),
                        Answer(text: "Кукуруза", type: .turtle)
                     ]
                    ),
            Question(text: "Что вы любите делать", type: .multiple,
                     answers: [
                        Answer(text: "Плавать", type: .dog),
                        Answer(text: "Спать", type: .rabbit),
                        Answer(text: "Обниматься", type: .cat),
                        Answer(text: "Есть", type: .turtle)
                     ]
                    ),
            Question(text: "Любите ли вы поездки на машине?", type: .range,
                     answers: [
                        Answer(text: "Обожаю", type: .dog),
                        Answer(text: "Ненавижу", type: .rabbit),
                        Answer(text: "Ненавижу", type: .cat),
                        Answer(text: "Обожаю", type: .turtle)
                     ]
                    ),
            ]
    }
}
