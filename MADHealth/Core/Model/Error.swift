//
//  Error.swift
//  MADHealth
//
//  Created by Mikita Poluektau on 13.11.21.
//

import UIKit

class Error: NSObject, Decodable {
    
    var message: String?
    var statusCode: Int?
    
    enum CodingKeys: String, CodingKey {
        case statusCode, message
    }
    
    required convenience init(message: String, code: Int) {
        self.init()
        self.message = message
        self.statusCode = code
    }

    required convenience init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try? values.decodeIfPresent(String.self, forKey: .message)
        statusCode = try? values.decodeIfPresent(Int.self, forKey: .statusCode)
    }

}
