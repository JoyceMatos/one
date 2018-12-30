//
//  SignUpViewController.swift
//  oneLife
//
//  Created by Joyce Matos on 12/29/18.
//  Copyright © 2018 Joyce Matos. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, SignUpViewable {
    typealias Presenter = SignUpPresenter
    typealias View = SignUpViewable
    
    lazy var presenter = { Injector.instance.container.resolve(SignUpPresenter.self, argument: self as SignUpViewable)! }()
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var name: String! {
        return nameTextField.text
    }
    
    var email: String! {
        return emailTextField.text
    }
    
    var password: String! {
        return passwordTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapSignUp(_ sender: Any) {
        presenter.didTapSignUp()
    }
    
    func showHome() {
        performSegue(withIdentifier: "showHome", sender: nil)
    }
}
