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
    
    func logIn(_ email: String, password: String) -> Single<User> {
        return Single<User>.create { single -> Disposable in
            Auth.auth().signIn(withEmail: email, password: password, completion: { (result, error) in
                if let error = error {
                    single(.error(error))
                } else {
                    let user = User(id: result!.user.uid, name: nil, email: email)
                    single(.success(user))
                }
            })
            return Disposables.create()
        }
    }

    // Note - Might not even need to return anything here. Just handle error
    func create(_ user: User, password: String) -> Single<User> {
        return Single<User>.create { single -> Disposable in
            Auth.auth().createUser(withEmail: user.email, password: password, completion: { (result, error) in
                if let userId = result?.user.uid {
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
    
    func createList(_ list: List, userId: String) -> Completable {
        return Completable.create { completable in
            let listRef = self.ref.child(Constants.Firebase.lists).child(userId).childByAutoId()
            listRef.setValue(list.serialize(), withCompletionBlock: { error, ref in
                if let error = error {
                    completable(.error(error))
                }
            })
            
            // Figure out how to get this to add new value instead of overwrite existing one
            self.ref.child(Constants.Firebase.users).child(userId).child(Constants.Firebase.lists).setValue([listRef.key: true], withCompletionBlock: { error, ref in
                if let error = error {
                    completable(.error(error))
                }
                
                completable(.completed)
            })
            
            return Disposables.create()
        }
    }
    
    func fetchLists(_ userId: String) -> Single<[List]> {
        return Single<[List]>.create { single -> Disposable in
            self.ref.child(Constants.Firebase.users).child(userId).child(Constants.Firebase.lists).observeSingleEvent(of: .value, with: { snapshot in
                
                snapshot.value as! [String]
                
            })
            return Disposables.create()
        }
    }
    
    func logOut() {
        try? Auth.auth().signOut()
    }
}
