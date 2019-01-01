//
//  LoginPresenter.swift
//  oneLife
//
//  Created by Joyce Matos on 12/29/18.
//  Copyright © 2018 Joyce Matos. All rights reserved.
//

import RxSwift

final class LoginPresenter {
    unowned let view: LoginViewable
    unowned let firebaseAdapter: FirebaseAdapting
    unowned let mainScheduler: MainScheduler
    
    let disposeBag = DisposeBag()
    
    init(view: LoginViewable,
         firebaseAdapter: FirebaseAdapting,
         mainScheduler: MainScheduler) {
        self.view = view
        self.firebaseAdapter = firebaseAdapter
        self.mainScheduler = mainScheduler
    }
    
    func didTapLogin() {
        guard let email = view.email, let password = view.password else {
            // TODO: - Show alert
            return
        }
        
        firebaseAdapter.logIn(email, password: password)
        .observeOn(mainScheduler)
        .subscribe(onSuccess: { user in
            self.view.showHome()
        }, onError: { error in
            // TODO: - Handle error
        })
    }
}
