//
//  History.swift
//  MADHealth
//
//  Created by Mikita Poluektau on 13.11.21.
//

import Foundation

class History: NSObject, Decodable {
    
    var id: Int = 0
    var createTime: String = ""
    var descriptionText: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id, create_time, description
    }

    required convenience init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id) ?? 0
        createTime = try values.decodeIfPresent(String.self, forKey: .create_time) ?? ""
        descriptionText = try values.decodeIfPresent(String.self, forKey: .description) ?? ""
    }

}
