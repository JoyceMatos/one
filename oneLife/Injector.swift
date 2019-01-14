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
            LoginPresenter(view: view, userInteractor: r.resolve(UserInteracting.self)!, firebaseAdapter: r.resolve(FirebaseAdapting.self)!, mainScheduler: r.resolve(MainScheduler.self)!)
        }
        container.register(SignUpPresenter.self) { r, view in
            SignUpPresenter(view: view, firebaseAdapter: r.resolve(FirebaseAdapting.self)!, mainScheduler: r.resolve(MainScheduler.self)!)
        }
        container.register(HomePresenter.self) { r, view in
            HomePresenter(view: view, firebaseAdapter: r.resolve(FirebaseAdapting.self)!)
        }
        container.register(AddListPresenter.self) { r, view in
            AddListPresenter(view: view, userInteractor: r.resolve(UserInteracting.self)!, firebaseAdapter: r.resolve(FirebaseAdapting.self)!, mainScheduler: r.resolve(MainScheduler.self)!)
        }
        
        // Adapters
        container.autoregister(FirebaseAdapting.self, initializer: FirebaseAdapter.init).inObjectScope(.container)
        
        // Interactors
        container.autoregister(UserInteracting.self, initializer: UserInteractor.init).inObjectScope(.container)

        // Other
        container.autoregister(MainScheduler.self) { _ in MainScheduler.instance }.inObjectScope(.container)
    }
}
