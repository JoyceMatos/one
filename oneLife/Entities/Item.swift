//
//  Item.swift
//  oneLife
//
//  Created by Joyce Matos on 12/29/18.
//  Copyright © 2018 Joyce Matos. All rights reserved.
//

struct Item {
    var name: String
    var description: String
    
    func serialize() -> [String: Any] {
        return ["name": name, "description": description]
    }
}
