//
//  LoginViewController.swift
//  LoginRxSwiftMVVM
//
//  Created by Matthew Dolan on 2021-11-10.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {
    
    private let loginViewModel = LoginViewModel()
    private let disposeBag = DisposeBag()
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButtonEnabled()
        sendValueForLogin()
    }
    
    func sendValueForLogin() {
        usernameTextField.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.usernameTextPublishSubject).disposed(by: disposeBag)
        passwordTextField.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.passwordTextPublishSubject).disposed(by: disposeBag)
    }
    
    func loginButtonEnabled() {
        loginViewModel.isValid().bind(to: loginButton.rx.isEnabled).disposed(by: disposeBag)
        loginViewModel.isValid().map { $0 ? 1 : 0.1 }.bind(to: loginButton.rx.alpha).disposed(by: disposeBag)
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        print("login button pressed")
    }
}
