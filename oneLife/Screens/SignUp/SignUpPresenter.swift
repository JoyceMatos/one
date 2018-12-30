//
//  SignUpPresenter.swift
//  oneLife
//
//  Created by Joyce Matos on 12/29/18.
//  Copyright © 2018 Joyce Matos. All rights reserved.
//

import RxSwift

final class SignUpPresenter {
    unowned let view: SignUpViewable
    unowned let firebaseAdapter: FirebaseAdapting
    unowned let mainScheduler: MainScheduler
    
    let disposeBag = DisposeBag()
    
    init(view: SignUpViewable,
         firebaseAdapter: FirebaseAdapting,
         mainScheduler: MainScheduler) {
        self.view = view
        self.firebaseAdapter = firebaseAdapter
        self.mainScheduler = mainScheduler
    }
    
    func didTapSignUp() {
        guard let name = view.name, let email = view.email, let password = view.password else {
            // TODO: - Show alert
            return
        }
        
        let user = User(id: nil, name: name, email: email)
        
        _ = firebaseAdapter.create(user, password: password).map { user in
            self.firebaseAdapter.logIn(user.email, password: password)
        }
            .observeOn(mainScheduler)
            .subscribe(onSuccess: { user in
                self.view.showHome()
                // Segue to home screen
            }, onError: { error in
                // Handle erroe
            })
    }
}
