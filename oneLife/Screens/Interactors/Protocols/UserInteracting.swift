//
//  UserInteracting.swift
//  oneLife
//
//  Created by Joyce Matos on 1/13/19.
//  Copyright © 2019 Joyce Matos. All rights reserved.
//

protocol UserInteracting: class {
    var user: User? { get set }
    func clearUser()
}
