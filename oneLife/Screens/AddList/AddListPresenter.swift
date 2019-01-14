//
//  AddListPresenter.swift
//  oneLife
//
//  Created by Joyce Matos on 1/1/19.
//  Copyright © 2019 Joyce Matos. All rights reserved.
//

import RxSwift

final class AddListPresenter {
    unowned let view: AddListViewable
    unowned let userInteractor: UserInteracting
    unowned let firebaseAdapter: FirebaseAdapting
    unowned let mainScheduler: MainScheduler
    let disposeBag = DisposeBag()
    
    init(view: AddListViewable,
         userInteractor: UserInteracting,
         firebaseAdapter: FirebaseAdapting,
         mainScheduler: MainScheduler) {
        self.view = view
        self.userInteractor = userInteractor
        self.firebaseAdapter = firebaseAdapter
        self.mainScheduler = mainScheduler
    }
    
    func didTapAdd() {
        guard let userId = userInteractor.user?.id else {
            return
        }
        
        let list = List(name: view.listTitle)
        _ = firebaseAdapter.createList(list, userId: userId)
            .observeOn(mainScheduler)
            .subscribe(onCompleted: {
                self.view.dismiss()
            }, onError: { error in
                // Handle error
            })
    }
    
    func didTapClose() {
        view.dismiss()
    }
}
