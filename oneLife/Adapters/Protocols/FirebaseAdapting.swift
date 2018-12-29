//
//  FirebaseAdapting.swift
//  oneLife
//
//  Created by Joyce Matos on 12/27/18.
//  Copyright © 2018 Joyce Matos. All rights reserved.
//

protocol FirebaseAdapting: class {
    func logIn(_ user: User, password: String, completion: @escaping (User?) -> Void)
    func create(_ user: User, password: String, completion: @escaping (User?) -> Void)
    func logOut()
}
