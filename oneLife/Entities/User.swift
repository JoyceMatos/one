//
//  User.swift
//  oneLife
//
//  Created by Joyce Matos on 12/27/18.
//  Copyright © 2018 Joyce Matos. All rights reserved.
//

struct User {
    var id: String?
    let name: String
    let email: String
    
    func serialize() -> [String: Any] {
        return ["name": name, "email": email]
    }
}
