//
//  FirebaseAdapter.swift
//  oneLife
//
//  Created by Joyce Matos on 12/27/18.
//  Copyright © 2018 Joyce Matos. All rights reserved.
//

import Firebase

class FirebaseAdapter: FirebaseAdapting {
    private var ref = Database.database().reference()
    
    func authenticate(_ newUser: User?, password: String, completion: @escaping (Bool, User?) -> Void) {
        
    }
}
