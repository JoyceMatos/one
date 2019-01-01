//
//  HomePresenter.swift
//  oneLife
//
//  Created by Joyce Matos on 12/27/18.
//  Copyright © 2018 Joyce Matos. All rights reserved.
//

class HomePresenter {
    unowned let view: HomeViewable
    
    init(view: HomeViewable) {
        self.view = view
    }
    
    func didTapList() {
        view.showList()
    }
    
    func didTapAddList() {
        view.showAddList()
    }
}
