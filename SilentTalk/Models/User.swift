//
//  File.swift
//  SilentTalk
//
//  Created by takuya_tominaga on 12/10/20.
//

struct User: Hashable, Codable {
    var customSize: Double = 0
    var headMessage: String
    var bottomMessage: String
    var answerCard: [AnswerCard]
    var memo: String
    
    private enum CodingKeys:CodingKey {
        case customSize
        case headMessage
        case bottomMessage
        case answerCard
        case memo
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        headMessage = try values.decode(String.self, forKey: .headMessage)
        bottomMessage = try values.decode(String.self, forKey: .bottomMessage)
        answerCard = try values.decode([AnswerCard].self, forKey: .answerCard)
        memo = try values.decode(String.self, forKey: .memo)
        do {
            customSize = try values.decode(Double.self, forKey: .customSize)
        } catch DecodingError.keyNotFound{
            customSize = 28
        }
    }
}
