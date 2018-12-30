//
//  User.swift
//  oneLife
//
//  Created by Joyce Matos on 12/27/18.
//  Copyright © 2018 Joyce Matos. All rights reserved.
//

struct User {
    var id: String?
    let name: String?
    let email: String
    
    init(id: String? = nil, name: String?, email: String) {
        self.id = id
        self.name = name
        self.email = email
    }
    
    func serialize() -> [String: Any] {
        guard let name = name else {
            return ["email": email]
        }
        return ["name": name, "email": email]
    }
}
