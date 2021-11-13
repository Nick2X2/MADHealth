//
//  AuthModel.swift
//  MADHealth
//
//  Created by Mikita Poluektau on 13.11.21.
//

import Foundation

class AuthModel: NSObject, Decodable {
    
    var data: Profile?
    
    enum CodingKeys: String, CodingKey {
        case data
    }

    required convenience init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(Profile.self, forKey: .data)
    }

}
