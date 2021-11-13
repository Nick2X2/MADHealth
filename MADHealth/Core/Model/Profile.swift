//
//  Profile.swift
//  MADHealth
//
//  Created by Mikita Poluektau on 13.11.21.
//

import Foundation

class Profile: NSObject, Decodable {
    
    var email: String = ""
    var name: String = ""
    var avatar: String = ""
    
    enum CodingKeys: String, CodingKey {
        case email, name, avatar
    }

    required convenience init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        email = try values.decodeIfPresent(String.self, forKey: .email) ?? ""
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
        avatar = try values.decodeIfPresent(String.self, forKey: .avatar) ?? ""
    }

}
