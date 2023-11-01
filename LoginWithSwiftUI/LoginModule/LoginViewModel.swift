//
//  LoginViewModel.swift
//  LoginWithSwiftUI
//
//  Created by Suraj Prasad on 01/11/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var emailField: LoginFieldModel = LoginFieldModel(value: "", fieldType: .email)
    @Published var passwordField: LoginFieldModel = LoginFieldModel(value: "", fieldType: .password)
}
