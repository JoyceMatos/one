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
    
    func logIn(_ user: User, password: String, completion: @escaping (User?) -> Void) {
        Auth.auth().signIn(withEmail: user.email, password: password, completion: { (currentUser, error) in
            if error == nil {
                completion(user)
            } else {
                completion(nil)
            }
        })
    }
    
    func create(_ user: User, password: String, completion: @escaping (User?) -> Void) {
        Auth.auth().createUser(withEmail: user.email, password: password, completion: { (newUser, error) in
            if let userId = newUser?.uid {
                var user = user
                user.id = userId
                completion(user)
            } else {
                completion(nil)
            }
        })
    }
    
    func logOut() {
        try? Auth.auth().signOut()
    }
}
