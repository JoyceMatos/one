//
//  LoginViewable.swift
//  oneLife
//
//  Created by Joyce Matos on 12/29/18.
//  Copyright © 2018 Joyce Matos. All rights reserved.
//

protocol LoginViewable: class {
    var email: String! { get }
    var password: String! { get }
    
    func showHome()
}
