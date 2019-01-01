//
//  AddListPresenter.swift
//  oneLife
//
//  Created by Joyce Matos on 1/1/19.
//  Copyright © 2019 Joyce Matos. All rights reserved.
//

final class AddListPresenter {
    unowned let view: AddListViewable
    
    init(view: AddListViewable) {
        self.view = view
    }
    
    func didTapAdd() {
        view.dismiss()
    }
}
