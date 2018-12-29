//
//  FirebaseAdapter.swift
//  oneLife
//
//  Created by Joyce Matos on 12/27/18.
//  Copyright © 2018 Joyce Matos. All rights reserved.
//

import Firebase
import RxSwift

class FirebaseAdapter: FirebaseAdapting {
    private var ref = Database.database().reference()
    
    func logIn(_ user: User, password: String) -> Single<User> {
        return Single<User>.create { single -> Disposable in
            Auth.auth().signIn(withEmail: user.email, password: password, completion: { (currentUser, error) in
                if let error = error {
                    single(.error(error))
                } else {
                    single(.success(user))
                }
            })
            return Disposables.create()
        }
    }

    // Might not even need to return anything here. Just handle error
    func create(_ user: User, password: String) -> Single<User> {
        return Single<User>.create { single -> Disposable in
            Auth.auth().createUser(withEmail: user.email, password: password, completion: { (newUser, error) in
                if let userId = newUser?.uid {
                    var user = user
                    user.id = userId
                    
                    self.ref.child(Constants.Firebase.users).child(userId).setValue(user.serialize())
                    
                    single(.success(user))
                } else {
                    single(.error(error!))
                }
            })
            return Disposables.create()
        }
    }
    
    func logOut() {
        try? Auth.auth().signOut()
    }
}
