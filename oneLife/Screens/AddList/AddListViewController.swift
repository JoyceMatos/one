//
//  AddListViewController.swift
//  oneLife
//
//  Created by Joyce Matos on 1/1/19.
//  Copyright © 2019 Joyce Matos. All rights reserved.
//

import UIKit

class AddListViewController: UIViewController {
    typealias Presenter = AddListPresenter
    typealias View = AddListViewable
    
    lazy var presenter = { Injector.instance.container.resolve(AddListPresenter.self, argument: self as AddListViewable)! }()
    
    
    @IBOutlet weak var listTitleTextField: UITextField!
    
    var listTitle: String! {
        return listTitleTextField.text
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapAdd(_ sender: Any) {
        presenter.didTapAdd()
    }
    
    @IBAction func didTapClose(_ sender: Any) {
        presenter.didTapClose()
    }
}

extension AddListViewController: AddListViewable {
    func dismiss() {
        dismiss(animated: true, completion: nil)
    }
}
