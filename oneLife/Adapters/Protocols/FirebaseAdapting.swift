//
//  FirebaseAdapting.swift
//  oneLife
//
//  Created by Joyce Matos on 12/27/18.
//  Copyright © 2018 Joyce Matos. All rights reserved.
//

protocol FirebaseAdapting: class {
    func authenticate(_ newUser: User?, password: String, completion: @escaping (Bool, User?) -> Void)
}
