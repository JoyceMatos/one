//
//  HomeViewController.swift
//  oneLife
//
//  Created by Joyce Matos on 12/23/18.
//  Copyright © 2018 Joyce Matos. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    typealias Presenter = HomePresenter
    typealias View = HomeViewable
    
    lazy var presenter = { Injector.instance.container.resolve(HomePresenter.self, argument: self as HomeViewable)! }()
    
    @IBOutlet weak var tableview: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapAddList(_ sender: Any) {
        presenter.didTapAddList()
    }
}

extension HomeViewController: HomeViewable {
    func showList() {
        performSegue(withIdentifier: "showList", sender: nil)
    }

    func showAddList() {
        performSegue(withIdentifier: "showAddList", sender: nil)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell") as! ListTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didTapList()
    }
}

