//
//  LoginViewModel.swift
//  LoginRxSwiftMVVM
//
//  Created by Matthew Dolan on 2021-11-13.
//

import Foundation
import RxSwift

class LoginViewModel {
    let usernameTextPublishSubject = PublishSubject<String>()
    let passwordTextPublishSubject = PublishSubject<String>()
    
    func isValid() -> Observable<Bool> {
        return Observable.combineLatest(usernameTextPublishSubject.asObservable().startWith(""), passwordTextPublishSubject.asObservable()).map { username, password in
            return username.count > 3 && password.count > 3
        }.startWith(false)
    }
}
