//
//  List.swift
//  oneLife
//
//  Created by Joyce Matos on 12/29/18.
//  Copyright © 2018 Joyce Matos. All rights reserved.
//

struct List {
    var name: String
    var items: [Item]?
    
    init(name: String,
         items: [Item]? = nil) {
        self.name = name
        self.items = items
    }
    
    func serialize() -> [String: Any] {
        guard let items = items else {
            return ["name": name]
        }
        return ["name": name, "items": items]
    }
}
