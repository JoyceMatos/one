//
//  FirebaseAdapting.swift
//  oneLife
//
//  Created by Joyce Matos on 12/27/18.
//  Copyright © 2018 Joyce Matos. All rights reserved.
//

import RxSwift

protocol FirebaseAdapting: class {
    func logIn(_ email: String, password: String) -> Single<User>
    func create(_ user: User, password: String) -> Single<User>
    func logOut()
}
