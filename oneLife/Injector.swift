//
//  Injector.swift
//  oneLife
//
//  Created by Joyce Matos on 12/29/18.
//  Copyright © 2018 Joyce Matos. All rights reserved.
//

import RxSwift
import Swinject
import SwinjectAutoregistration

final class Injector {
    static let instance = Injector()
    let container = Container()
    
    init() {
        registerDependencies()
    }
    
    func registerDependencies() {
        container.register(LoginPresenter.self) { r, view in
            LoginPresenter(view: view, firebaseAdapter: r.resolve(FirebaseAdapting.self)!)
        }
        container.register(SignUpPresenter.self) { r, view in
            SignUpPresenter(view: view, firebaseAdapter: r.resolve(FirebaseAdapting.self)!, mainScheduler: r.resolve(MainScheduler.self)!)
        }
        
        container.autoregister(FirebaseAdapting.self, initializer: FirebaseAdapter.init).inObjectScope(.container)
        
        container.autoregister(MainScheduler.self) { _ in MainScheduler.instance }.inObjectScope(.container)
    }
}
