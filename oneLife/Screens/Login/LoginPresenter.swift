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
    unowned let userInteractor: UserInteracting
    unowned let firebaseAdapter: FirebaseAdapting
    unowned let mainScheduler: MainScheduler
    
    let disposeBag = DisposeBag()
    
    init(view: LoginViewable,
         userInteractor: UserInteracting,
         firebaseAdapter: FirebaseAdapting,
         mainScheduler: MainScheduler) {
        self.view = view
        self.userInteractor = userInteractor
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
            self.userInteractor.user = user
            self.view.showHome()
        }, onError: { error in
            // TODO: - Handle error
        })
    }
}
