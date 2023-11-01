//
//  LoginFieldModel.swift
//  LoginWithSwiftUI
//
//  Created by Suraj Prasad on 01/11/23.
//

import Foundation

struct LoginFieldModel {
    var value: String
    var error: String?
    var fieldType: LoginFieldType
    
    init(value: String, error: String? = nil, fieldType: LoginFieldType) {
        self.value = value
        self.error = error
        self.fieldType = fieldType
    }
    
    mutating func onValidate() -> Bool {
        error = fieldType.validate(value: value)
        return error == nil
    }
    
    mutating func onSubmitError() {
        error = fieldType.validate(value: value)
    }
}

protocol FieldValidatorProtocol {
    func validate(value: String) -> String?
}

enum LoginFieldType: FieldValidatorProtocol {
    case email
    case password
    
    var placeholder: String {
        switch self {
        case .email:
            return "Email"
            
        case .password:
            return "Password"
        }
    }
    
    private func emailValidate(value: String) -> String? {
        if value.isEmpty {
            return "Please enter your emaillId"
        } else {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailPred.evaluate(with: value) ? nil : "Please enter your valid emailId"
        }
    }
    
    private func passwordValidate(value: String) -> String? {
        value.isEmpty ? "Please enter your password" : nil
    }
    
    func validate(value: String) -> String? {
        switch self {
        case .email:
            return emailValidate(value: value)
        case .password:
            return passwordValidate(value: value)
        }
    }
}
