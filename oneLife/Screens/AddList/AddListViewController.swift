//
//  AddListViewController.swift
//  oneLife
//
//  Created by Joyce Matos on 1/1/19.
//  Copyright © 2019 Joyce Matos. All rights reserved.
//

import UIKit

class AddListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension AddListViewController: AddListViewable {
    func dismiss() {
        dismiss(animated: true, completion: nil)
    }
}
