//
//  LoginViewController.swift
//  oneLife
//
//  Created by Joyce Matos on 12/29/18.
//  Copyright © 2018 Joyce Matos. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, LoginViewable {
    typealias Presenter = LoginPresenter
    typealias View = LoginViewable
    
    lazy var presenter = { Injector.instance.container.resolve(LoginPresenter.self, argument: self as LoginViewable)! }()
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var email: String! {
        return emailTextField.text
    }
    
    var password: String! {
        return passwordTextField.text
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func didTapLogin(_ sender: Any) {
        presenter.didTapLogin()
    }
}
