//
//  HomePresenter.swift
//  oneLife
//
//  Created by Joyce Matos on 12/27/18.
//  Copyright © 2018 Joyce Matos. All rights reserved.
//

class HomePresenter {
    unowned let view: HomeViewable
    unowned let firebaseAdapter: FirebaseAdapting
    
    init(view: HomeViewable,
         firebaseAdapter: FirebaseAdapting) {
        self.view = view
        self.firebaseAdapter = firebaseAdapter
    }
    
    func fetchLists() {
        
    }
    
    func didTapList() {
        view.showList()
    }
    
    func didTapAddList() {
        view.showAddList()
    }
}
