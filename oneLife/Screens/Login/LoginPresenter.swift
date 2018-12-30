//
//  LoginPresenter.swift
//  oneLife
//
//  Created by Joyce Matos on 12/29/18.
//  Copyright © 2018 Joyce Matos. All rights reserved.
//

final class LoginPresenter {
    unowned let view: LoginViewable
    unowned let firebaseAdapter: FirebaseAdapting
    
    init(view: LoginViewable,
         firebaseAdapter: FirebaseAdapting) {
        self.view = view
        self.firebaseAdapter = firebaseAdapter
    }
    
    func didTapLogin() {
        
        guard let email = view.email, let password = view.password else {
            // TODO: - Show alert
            return
        }
        
        firebaseAdapter.logIn(email, password: password)

    }
}
